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
