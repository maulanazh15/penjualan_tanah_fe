// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'land_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LandModelImpl _$$LandModelImplFromJson(Map<String, dynamic> json) =>
    _$LandModelImpl(
      id: json['id'] as int?,
      judul: json['judul'] as String,
      harga: json['harga'] as int,
      luas: (json['luas'] as num).toDouble(),
      alamat: json['alamat'] as String,
      fotoTanah: json['foto_tanah'] as String?,
      provId: json['prov_id'] as int?,
      cityId: json['city_id'] as int?,
      disId: json['dis_id'] as int?,
      subDisId: json['subdis_id'] as int?,
      keterangan: json['keterangan'] as String?,
      tanahLatitude: (json['tanahLatitude'] as num?)?.toDouble(),
      tanahLongitude: (json['tanahLongitude'] as num?)?.toDouble(),
      userId: json['user_id'] as int?,
    );

Map<String, dynamic> _$$LandModelImplToJson(_$LandModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'judul': instance.judul,
      'harga': instance.harga,
      'luas': instance.luas,
      'alamat': instance.alamat,
      'foto_tanah': instance.fotoTanah,
      'prov_id': instance.provId,
      'city_id': instance.cityId,
      'dis_id': instance.disId,
      'subdis_id': instance.subDisId,
      'keterangan': instance.keterangan,
      'tanahLatitude': instance.tanahLatitude,
      'tanahLongitude': instance.tanahLongitude,
      'user_id': instance.userId,
    };
