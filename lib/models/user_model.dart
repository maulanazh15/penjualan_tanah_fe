import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:penjualan_tanah_fe/repositories/core/endpoints.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserEntity with _$UserEntity {
  const UserEntity._();

  factory UserEntity({
    required int id,
    required String email,
    required String username,
    @JsonKey(name: 'prov_id') int? provId,
    @JsonKey(name: 'city_id') int? cityId,
    @JsonKey(name: 'dis_id') int? disId,
    @JsonKey(name: 'subdis_id') int? subDisId,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  String get urlProfileImage {
    
    return "${Endpoints.getPhotoProfile}?user_id=$id";

  }

  ChatUser get toChatUser {
    return ChatUser(
      id: id.toString(),
      firstName: username,
      profileImage: urlProfileImage,
    );
  }
}

@freezed
class AuthUser with _$AuthUser {
  factory AuthUser({
    required UserEntity user,
    required String token,
  }) = _AuthUser;

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);
}
