// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: json['id'] as int,
      email: json['email'] as String,
      username: json['username'] as String,
      provId: json['prov_id'] as int?,
      cityId: json['city_id'] as int?,
      disId: json['dis_id'] as int?,
      subDisId: json['subdis_id'] as int?,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'prov_id': instance.provId,
      'city_id': instance.cityId,
      'dis_id': instance.disId,
      'subdis_id': instance.subDisId,
    };

_$AuthUserImpl _$$AuthUserImplFromJson(Map<String, dynamic> json) =>
    _$AuthUserImpl(
      user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$$AuthUserImplToJson(_$AuthUserImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };
