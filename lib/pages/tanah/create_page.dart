import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:penjualan_tanah_fe/blocs/auth/auth_bloc.dart';
import 'package:penjualan_tanah_fe/blocs/user/user_bloc.dart';
import 'package:penjualan_tanah_fe/models/land_model.dart';
import 'package:penjualan_tanah_fe/pages/components/avatar_profile.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:penjualan_tanah_fe/pages/tanah/crud_tanah_page.dart';
import 'package:penjualan_tanah_fe/repositories/core/endpoints.dart';
import 'package:penjualan_tanah_fe/repositories/land/land_repository.dart';
import 'package:penjualan_tanah_fe/repositories/location/location_repository.dart';
import 'package:penjualan_tanah_fe/utils/logger.dart';
import '../../models/location_model.dart';
import '../../models/requests/user_update/user_update_request.dart';
import '../../utils/dio_client/dio_client.dart';
import 'package:penjualan_tanah_fe/repositories/user/base_user_repository.dart';

class CreateLandScreen extends StatefulWidget {
  const CreateLandScreen({Key? key}) : super(key: key);

  static const routeName = 'create-land';

  @override
  State<CreateLandScreen> createState() => _CreateLandScreenState();
}

class _CreateLandScreenState extends State<CreateLandScreen> {
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
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);

    if (image != null) {
      // You can now use the 'image' object, which contains the captured photo.
      // Update your profile picture with this image.
      setState(() {
        _image = image;
      });
    }
  }

  Future<void> _pickImage() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

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
      setState(() {
        provinces = value;
      });
    });
  }

  final _formKey = GlobalKey<FormState>();
  final user = AuthBloc().state.user;
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _luasController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _subDistrictController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final TextEditingController _judulController =
    //     TextEditingController(text: user?.username);
    // final TextEditingController _hargaController =
    //     TextEditingController(text: user?.email);
    void _showSuccessDialog(BuildContext context, String message) {
      showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop(true); // Close the dialog after 2 seconds
          });
          return AlertDialog(
            content: Text(message),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Buat Tanah",
            style: Theme.of(context).textTheme.headlineSmall),
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
                    width: double.maxFinite,
                    height: 120,
                    child: _image != null
                        ? 
                        Image.file(File(_image!.path),)
                          
                        : Image.network(
                          user!.urlProfileImage,
                        ),
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
                        icon: const Icon(Icons.camera),
                        color: Colors.black,
                        iconSize: 20,
                        onPressed: () async {
                          await _takePicture();
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
                      controller: _judulController,
                      decoration: const InputDecoration(
                          label: Text("Judul"), prefixIcon: Icon(Icons.person)),
                    ),
                    const SizedBox(height: 40 - 20),
                    TextFormField(
                      controller: _hargaController,
                      decoration: const InputDecoration(
                          label: Text("Harga"),
                          prefixIcon: Icon(Icons.price_change)),
                    ),
                    const SizedBox(height: 40 - 20),
                    TextFormField(
                      controller: _luasController,
                      decoration: const InputDecoration(
                          label: Text("Luas"),
                          prefixIcon: Icon(Icons.landscape)),
                    ),
                    const SizedBox(height: 40 - 20),
                    TextFormField(
                      controller: _alamatController,
                      decoration: const InputDecoration(
                          label: Text("Alamat"), prefixIcon: Icon(Icons.email)),
                    ),
                    const SizedBox(height: 40 - 20),
                    TextFormField(
                      controller: _keteranganController,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                          label: Text("Keterangan"),
                          prefixIcon: Icon(Icons.email)),
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
                          final result =
                              await LandRepository().createLand(LandModel(
                            judul: _judulController.text,
                            harga: int.parse(_hargaController.text),
                            luas: double.parse(_luasController.text),
                            alamat: _alamatController.text,
                            provId: selectedProvince?.provId,
                            cityId: selectedCity?.cityId,
                            disId: selectedDistrict?.disId,
                            subDisId: selectedSubDistrict?.subdisId,
                            keterangan: _keteranganController.text,
                            userId: user?.id,
                          ).toJson(), _image);
                          eLog(result);
                          if (result.success) {
                            if (mounted) {
                              
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Update Berhasil")));
                            Navigator.of(context)
                                .pushNamed(CrudLandPage.routeName);
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Update Gagal")));
                          }
                          // _showSuccessDialog(context, "Update Berhasil");
                        }
                        // () => Get.to(() => const CreateLandScreen())
                        ,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amberAccent,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text("Update Profile",
                            style: TextStyle(color: Colors.black87)),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // -- Created Date and Delete Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            text: "Joined",
                            style: TextStyle(fontSize: 12),
                            children: [
                              TextSpan(
                                  text: " Joined at",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12))
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _judulController.text = "";
                            _hargaController.text = "";
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
                              backgroundColor:
                                  Colors.redAccent.withOpacity(0.1),
                              elevation: 0,
                              foregroundColor: Colors.red,
                              shape: const StadiumBorder(),
                              side: BorderSide.none),
                          child: const Text("Delete"),
                        ),
                      ],
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
