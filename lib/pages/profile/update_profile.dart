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
import 'package:penjualan_tanah_fe/utils/logger.dart';
import '../../models/requests/user_update/user_update_request.dart';
import '../../utils/dio_client/dio_client.dart';
import 'package:penjualan_tanah_fe/repositories/user/base_user_repository.dart';

class Province {
  final int provId;
  final String provName;
  final int locationId;
  final int status;

  Province({
    required this.provId,
    required this.provName,
    required this.locationId,
    required this.status,
  });

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      provId: json['prov_id'] as int,
      provName: json['prov_name'] as String,
      locationId: json['locationid'] as int,
      status: json['status'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'prov_id': provId,
      'prov_name': provName,
      'locationid': locationId,
      'status': status,
    };
  }
}

class City {
  final int cityId;
  final String cityName;
  final int provId;

  City({
    required this.cityId,
    required this.cityName,
    required this.provId,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      cityId: json['city_id'] as int,
      cityName: json['city_name'] as String,
      provId: json['prov_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city_id': cityId,
      'city_name': cityName,
      'prov_id': provId,
    };
  }
}

class District {
  final int disId;
  final String disName;
  final int cityId;

  District({
    required this.disId,
    required this.disName,
    required this.cityId,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      disId: json['dis_id'] as int,
      disName: json['dis_name'] as String,
      cityId: json['city_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dis_id': disId,
      'dis_name': disName,
      'city_id': cityId,
    };
  }
}

class SubDistrict {
  final int subdisId;
  final String subdisName;
  final int disId;

  SubDistrict({
    required this.subdisId,
    required this.subdisName,
    required this.disId,
  });

  factory SubDistrict.fromJson(Map<String, dynamic> json) {
    return SubDistrict(
      subdisId: json['subdis_id'] as int,
      subdisName: json['subdis_name'] as String,
      disId: json['dis_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subdis_id': subdisId,
      'subdis_name': subdisName,
      'dis_id': disId,
    };
  }
}

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  static const routeName = 'update-profile';

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final Dio _dioClient = DioClient().instance;
  List<Province>? provinces;
  Province? selectedProvince;
  List<City>? cities;
  City? selectedCity;
  List<District>? districts;
  District? selectedDistrict;
  List<SubDistrict>? subDistricts;
  SubDistrict? selectedSubDistrict;

  Future<List<Province>?> fetchDataProvinces() async {
    // Replace with your API endpoint URL
    try {
      final response = await _dioClient.get(Endpoints.getProvinces);
      if (response.data['success'] && response.data['data'] != null) {
        provinces = (response.data['data'] as List<dynamic>)
            .map((e) => Province.fromJson(e))
            .toList();
        // iLog(provinces![0].provName);
        return provinces;
      }
      return provinces;
    } catch (error) {
      eLog(error);
      throw Exception('Error: $error');
    }
  }

  Future<List<City>?> fetchDataCities(int id) async {
    // Replace with your API endpoint URL
    try {
      final response =
          await _dioClient.get("${Endpoints.baseLocation}/province/$id/cities");
      if (response.data['success'] && response.data['data'] != null) {
        cities = (response.data['data'] as List<dynamic>)
            .map((e) => City.fromJson(e))
            .toList();
        // iLog(provinces![0].provName);
        return cities;
      }
      return cities;
    } catch (error) {
      eLog(error);
      throw Exception('Error: $error');
    }
  }

  Future<List<District>?> fetchDataDistricts(int id) async {
    // Replace with your API endpoint URL
    try {
      final response =
          await _dioClient.get("${Endpoints.baseLocation}/city/$id/districts");
      if (response.data['success'] && response.data['data'] != null) {
        districts = (response.data['data'] as List<dynamic>)
            .map((e) => District.fromJson(e))
            .toList();
        // iLog(provinces![0].provName);
        return districts;
      }
      return districts;
    } catch (error) {
      eLog(error);
      throw Exception('Error: $error');
    }
  }

  Future<List<SubDistrict>?> fetchDataSubDistricts(int id) async {
    // Replace with your API endpoint URL
    try {
      final response = await _dioClient
          .get("${Endpoints.baseLocation}/district/$id/subdistricts");
      if (response.data['success'] && response.data['data'] != null) {
        subDistricts = (response.data['data'] as List<dynamic>)
            .map((e) => SubDistrict.fromJson(e))
            .toList();
        // iLog(provinces![0].provName);
        return subDistricts;
      }
      return subDistricts;
    } catch (error) {
      eLog(error);
      throw Exception('Error: $error');
    }
  }

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
    fetchDataProvinces().then((value) {
      setState(() {
        provinces = value;
      });
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
    // final TextEditingController _usernameController =
    //     TextEditingController(text: user?.username);
    // final TextEditingController _emailController =
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
                        List<City>? citiesFetch =
                            await fetchDataCities(province.provId);
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
                            await fetchDataDistricts(city.cityId);
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
                            await fetchDataSubDistricts(district.disId);
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
                          final result = await UserRepository().updateUser(
                              UserUpdateRequest(
                                username: _usernameController.text,
                                email: _emailController.text,
                                provId: selectedProvince?.provId,
                                cityId: selectedCity?.cityId,
                                disId: selectedDistrict?.disId,
                                subDisId: selectedSubDistrict?.subdisId,
                              ),
                              _image);
                          eLog(result);
                          if (result.success) {
                            authBloc.add(
                              Authenticated(
                                isAuthenticated: true,
                                token: authBloc.state.token,
                                user: result.data)
                                );
                            iLog(authBloc.state.user);
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Update Berhasil")));
                          }
                          // _showSuccessDialog(context, "Update Berhasil");
                        }
                        // () => Get.to(() => const UpdateProfileScreen())
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
