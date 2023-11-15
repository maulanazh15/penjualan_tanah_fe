// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserUpdateRequestImpl _$$UserUpdateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UserUpdateRequestImpl(
      username: json['username'] as String?,
      email: json['email'] as String?,
      provId: json['prov_id'] as int?,
      cityId: json['city_id'] as int?,
      disId: json['dis_id'] as int?,
      subDisId: json['subdis_id'] as int?,
    );

Map<String, dynamic> _$$UserUpdateRequestImplToJson(
        _$UserUpdateRequestImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'prov_id': instance.provId,
      'city_id': instance.cityId,
      'dis_id': instance.disId,
      'subdis_id': instance.subDisId,
    };
