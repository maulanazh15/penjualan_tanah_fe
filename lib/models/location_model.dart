import 'package:penjualan_tanah_fe/utils/logger.dart';

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
  Province? province;

  City({
    required this.cityId,
    required this.cityName,
    required this.provId,
    Province? province,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      cityId: json['city_id'] as int,
      cityName: json['city_name'] as String,
      provId: json['prov_id'] as int,
      province:
          json['province'] != null ? Province.fromJson(json['province']) : null,
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
  City? city;

  District({
    required this.disId,
    required this.disName,
    required this.cityId,
    City? city,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      disId: json['dis_id'] as int,
      disName: json['dis_name'] as String,
      cityId: json['city_id'] as int,
      city: json['city'] != null ? City.fromJson(json['city']) : null,
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
  District? district;

  SubDistrict({
    required this.subdisId,
    required this.subdisName,
    required this.disId,
    District? district,
  });

  factory SubDistrict.fromJson(Map<String, dynamic> json) {
    SubDistrict subDistrict = SubDistrict(
      subdisId: json['subdis_id'] as int,
      subdisName: json['subdis_name'] as String,
      disId: json['dis_id'] as int,
      district:
          json['district'] != null ? District.fromJson(json['district']) : null,
    );
    return subDistrict;
  }

  Map<String, dynamic> toJson() {
    return {
      'subdis_id': subdisId,
      'subdis_name': subdisName,
      'dis_id': disId,
    };
  }
}

class LocationData {
  final int subDistrictId;
  final String subDistrictName;
  final int districtId;
  final String districtName;
  final int cityId;
  final String cityName;
  final int provinceId;
  final String provinceName;
  final int locationId;
  final int status;

  LocationData({
    required this.subDistrictId,
    required this.subDistrictName,
    required this.districtId,
    required this.districtName,
    required this.cityId,
    required this.cityName,
    required this.provinceId,
    required this.provinceName,
    required this.locationId,
    required this.status,
  });

  // Named constructor for a default LocationData instance
  LocationData.defaultLocation()
      : subDistrictId = 1,
        subDistrictName = 'Default Subdistrict',
        districtId = 1,
        districtName = 'Default District',
        cityId = 1,
        cityName = 'Default City',
        provinceId = 1,
        provinceName = 'Default Province',
        locationId = 1,
        status = 1;

  factory LocationData.fromJson(Map<String, dynamic> json) {
    final districtData = json['district'] as Map<String, dynamic>;
    final cityData = districtData['city'] as Map<String, dynamic>;
    final provinceData = cityData['province'] as Map<String, dynamic>;

    return LocationData(
      subDistrictId: json['subdis_id'] as int,
      subDistrictName: json['subdis_name'] as String,
      districtId: json['dis_id'] as int,
      districtName: districtData['dis_name'] as String,
      cityId: cityData['city_id'] as int,
      cityName: cityData['city_name'] as String,
      provinceId: provinceData['prov_id'] as int,
      provinceName: provinceData['prov_name'] as String,
      locationId: provinceData['locationid'] as int,
      status: provinceData['status'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subdis_id': subDistrictId,
      'subdis_name': subDistrictName,
      'dis_id': districtId,
      'district': {
        'dis_id': districtId,
        'dis_name': districtName,
        'city_id': cityId,
        'city': {
          'city_id': cityId,
          'city_name': cityName,
          'prov_id': provinceId,
          'province': {
            'prov_id': provinceId,
            'prov_name': provinceName,
            'locationid': locationId,
            'status': status,
          },
        },
      },
    };
  }
}
