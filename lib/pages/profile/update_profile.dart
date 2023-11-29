import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:penjualan_tanah_fe/blocs/auth/auth_bloc.dart';
import 'package:penjualan_tanah_fe/blocs/user/user_bloc.dart';
import 'package:penjualan_tanah_fe/pages/components/avatar_profile.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:penjualan_tanah_fe/repositories/core/endpoints.dart';
import 'package:penjualan_tanah_fe/repositories/location/location_repository.dart';
import 'package:penjualan_tanah_fe/utils/imagepicker.dart';
import 'package:penjualan_tanah_fe/utils/logger.dart';
import '../../models/location_model.dart';
import '../../models/requests/user_update/user_update_request.dart';
import '../../utils/dio_client/dio_client.dart';
import 'package:penjualan_tanah_fe/repositories/user/base_user_repository.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  static const routeName = 'update-profile';

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  List<Province>? provinces;
  Province? selectedProvince;
  List<City>? cities;
  City? selectedCity;
  List<District>? districts;
  District? selectedDistrict;
  List<SubDistrict>? subDistricts;
  SubDistrict? selectedSubDistrict;

  XFile? _image;
  final ImagePicker picker = ImagePicker();

  Future<void> _takePicture() async {
    XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
      imageQuality: quality,
    );

    if (image != null) {
      // You can now use the 'image' object, which contains the captured photo.
      // Update your profile picture with this image.
      setState(() {
        _image = image;
      });
    }
  }

  Future<void> _pickImage() async {
    XFile? image = await picker.pickImage(
        source: ImageSource.gallery, imageQuality: quality);

    if (image != null) {
      // You can now use the 'image' object, which contains the selected photo.
      // Update your profile picture with this image.
      setState(() {
        _image = image;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocationRepository().fetchDataProvinces().then((value) {
      if (mounted) {
        setState(() {
          final user = AuthBloc().state.user;
          provinces = value;
          _usernameController.text = user!.username;
          _emailController.text = user.email;
          if (user.subDisId != 0) {
            LocationRepository()
                .fetchDataLocation(user.subDisId!)
                .then((value) {
              _provinceController.text = value.provinceName;
              _cityController.text = value.cityName;
              _districtController.text = value.districtName;
              _subDistrictController.text = value.subDistrictName;
            });
          }
        });
      }
    });
  }

  final _formKey = GlobalKey<FormState>();
  final user = AuthBloc().state.user;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _subDistrictController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _showPickPictureDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Ambil Foto Profile Dari'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_image != null)
                  Image.file(
                    File(_image!.path),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ElevatedButton(
                  onPressed: () async {
                    await _takePicture();
                    Navigator.of(context).pop();
                  },
                  child: Text('Kamera'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _pickImage();
                    Navigator.of(context).pop();
                  },
                  child: Text('Ambil dari Galleri'),
                ),
              ],
            ),
          );
        },
      );
    }

    // final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile",
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              // -- IMAGE with ICON
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: _image != null
                        ? CircleAvatar(
                            backgroundImage: FileImage(File(_image!.path)),
                          )
                        : AvatarProfile(user: user!),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black12),
                      child: IconButton(
                        icon: Icon(Icons.camera),
                        color: Colors.black,
                        iconSize: 20,
                        onPressed: () {
                          _showPickPictureDialog(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // -- Form Fields
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                          label: Text("User Full Name"),
                          prefixIcon: Icon(Icons.person)),
                    ),
                    const SizedBox(height: 40 - 20),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          label: Text("Email"), prefixIcon: Icon(Icons.email)),
                    ),
                    const SizedBox(height: 40 - 20),
                    TypeAheadFormField<Province>(
                      textFieldConfiguration: TextFieldConfiguration(
                          controller: _provinceController,
                          decoration: const InputDecoration(
                            labelText: 'Provinsi',
                            prefixIcon: Icon(Icons.map_outlined),
                          )),
                      suggestionsCallback: (pattern) {
                        return provinces!
                            .where((province) => province.provName
                                .toLowerCase()
                                .contains(pattern.toLowerCase()))
                            .toList();
                      },
                      itemBuilder: (context, province) {
                        return ListTile(
                          leading: Icon(Icons.place_outlined),
                          title: Text(province.provName),
                        );
                      },
                      onSuggestionSelected: (province) async {
                        _provinceController.text = province.provName;
                        List<City>? citiesFetch = await LocationRepository()
                            .fetchDataCities(province.provId);
                        setState(() {
                          cities = citiesFetch;
                          selectedProvince = province;
                        });
                      },
                      validator: (value) =>
                          value!.isEmpty ? 'Pilih provinsi' : null,
                    ),
                    // typeAheadField(),
                    const SizedBox(height: 40 - 20),
                    TypeAheadFormField<City>(
                      textFieldConfiguration: TextFieldConfiguration(
                          controller: _cityController,
                          decoration: const InputDecoration(
                            labelText: 'Kabupaten/Kota',
                            prefixIcon: Icon(Icons.map_outlined),
                          )),
                      suggestionsCallback: (pattern) {
                        return cities!
                            .where((city) => city.cityName
                                .toLowerCase()
                                .contains(pattern.toLowerCase()))
                            .toList();
                      },
                      itemBuilder: (context, city) {
                        return ListTile(
                          leading: Icon(Icons.place_outlined),
                          title: Text(city.cityName),
                        );
                      },
                      onSuggestionSelected: (city) async {
                        _cityController.text = city.cityName;
                        List<District>? districtsFetch =
                            await LocationRepository()
                                .fetchDataDistricts(city.cityId);
                        setState(() {
                          selectedCity = city;
                          districts = districtsFetch;
                        });
                      },
                      validator: (value) =>
                          value!.isEmpty ? 'Pilih provinsi' : null,
                    ),
                    const SizedBox(height: 40 - 20),
                    TypeAheadFormField<District>(
                      textFieldConfiguration: TextFieldConfiguration(
                          controller: _districtController,
                          decoration: const InputDecoration(
                            labelText: 'Kecamatan',
                            prefixIcon: Icon(Icons.map_outlined),
                          )),
                      suggestionsCallback: (pattern) {
                        return districts!
                            .where((district) => district.disName
                                .toLowerCase()
                                .contains(pattern.toLowerCase()))
                            .toList();
                      },
                      itemBuilder: (context, district) {
                        return ListTile(
                          leading: Icon(Icons.place_outlined),
                          title: Text(district.disName),
                        );
                      },
                      onSuggestionSelected: (district) async {
                        _districtController.text = district.disName;
                        List<SubDistrict>? subDistrictsFetch =
                            await LocationRepository()
                                .fetchDataSubDistricts(district.disId);
                        setState(() {
                          selectedDistrict = district;
                          subDistricts = subDistrictsFetch;
                        });
                      },
                      validator: (value) =>
                          value!.isEmpty ? 'Pilih provinsi' : null,
                    ),
                    const SizedBox(height: 40 - 20),
                    TypeAheadFormField<SubDistrict>(
                      textFieldConfiguration: TextFieldConfiguration(
                          controller: _subDistrictController,
                          decoration: const InputDecoration(
                            labelText: 'Desa Kelurahan',
                            prefixIcon: Icon(Icons.map_outlined),
                          )),
                      suggestionsCallback: (pattern) {
                        return subDistricts!
                            .where((subDistrict) => subDistrict.subdisName
                                .toLowerCase()
                                .contains(pattern.toLowerCase()))
                            .toList();
                      },
                      itemBuilder: (context, subDistrict) {
                        return ListTile(
                          leading: Icon(Icons.place_outlined),
                          title: Text(subDistrict.subdisName),
                        );
                      },
                      onSuggestionSelected: (subDistrict) async {
                        _subDistrictController.text = subDistrict.subdisName;
                        setState(() {
                          selectedSubDistrict = subDistrict;
                        });
                      },
                      validator: (value) =>
                          value!.isEmpty ? 'Pilih provinsi' : null,
                    ),

                    const SizedBox(height: 40),

                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          final authBloc = context.read<AuthBloc>();
                          final result = await UserRepository()
                              .updateUser(
                                  UserUpdateRequest(
                                    username: _usernameController.text,
                                    email: _emailController.text,
                                    provId: selectedProvince?.provId,
                                    cityId: selectedCity?.cityId,
                                    disId: selectedDistrict?.disId,
                                    subDisId: selectedSubDistrict?.subdisId,
                                  ),
                                  _image)
                              .then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Proses ... ")));

                            return value;
                          });
                          eLog(result.toString());
                          if (result.success) {
                            authBloc.add(Authenticated(
                                isAuthenticated: true,
                                token: authBloc.state.token,
                                user: result.data));
                            iLog(authBloc.state.user);
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Update Berhasil")));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Update Gagal")));
                          }
                          // _showSuccessDialog(context, "Update Berhasil");
                        }
                        // () => Get.to(() => const UpdateProfileScreen())
                        ,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text("Update Profile",
                            style: TextStyle(color: Colors.black87)),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // -- Created Date and Delete Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _usernameController.text = "";
                          _emailController.text = "";
                          _provinceController.text = "";
                          _cityController.text = "";
                          _districtController.text = "";
                          _subDistrictController.text = "";
                          setState(() {
                            selectedProvince = null;
                            selectedCity = null;
                            selectedDistrict = null;
                            selectedSubDistrict = null;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent.withOpacity(0.1),
                            elevation: 0,
                            foregroundColor: Colors.red,
                            shape: const StadiumBorder(),
                            side: BorderSide.none),
                        child: const Text("Hapus Isi Form"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
