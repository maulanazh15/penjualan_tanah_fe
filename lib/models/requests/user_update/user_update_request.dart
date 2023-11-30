
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_update_request.freezed.dart';
part 'user_update_request.g.dart';

@freezed
class UserUpdateRequest with _$UserUpdateRequest {
  factory UserUpdateRequest({
    String? username,
    String? email,
    @JsonKey(name: 'prov_id') int? provId,
    @JsonKey(name: 'city_id') int? cityId,
    @JsonKey(name: 'dis_id') int? disId,
    @JsonKey(name: 'subdis_id') int? subDisId,
    // @JsonKey(name: 'photo_profile') required XFile profileImage
  }) = _UserUpdateRequest;
	
  factory UserUpdateRequest.fromJson(Map<String, dynamic> json) =>
			_$UserUpdateRequestFromJson(json);
}
