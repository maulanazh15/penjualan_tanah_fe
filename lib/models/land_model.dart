import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:penjualan_tanah_fe/repositories/core/endpoints.dart';

part 'land_model.freezed.dart';
part 'land_model.g.dart';

@freezed
class LandModel with _$LandModel {
  const LandModel._();

  factory LandModel({
    int? id,
    required String judul,
    required int harga,
    required double luas,
    required String alamat,
    @JsonKey(name: 'foto_tanah') String? fotoTanah,
    @JsonKey(name: 'prov_id') int? provId,
    @JsonKey(name: 'city_id') int? cityId,
    @JsonKey(name: 'dis_id') int? disId,
    @JsonKey(name: 'subdis_id') int? subDisId,
    String? keterangan,
    double? tanahLatitude,
    double? tanahLongitude,
    @JsonKey(name: 'user_id') int? userId,
  }) = _LandModel;

  factory LandModel.fromJson(Map<String, dynamic> json) =>
      _$LandModelFromJson(json);

  String get urlLandImage {
    return "${Endpoints.getLandPhoto}?land_id=$id";
  }
}
