
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'user_update_request.freezed.dart';
part 'user_update_request.g.dart';

@freezed
class UserUpdateRequest with _$UserUpdateRequest {
  factory UserUpdateRequest({
    required String username,
    required String email,
    // @JsonKey(name: 'photo_profile') required XFile profileImage
  }) = _UserUpdateRequest;
	
  factory UserUpdateRequest.fromJson(Map<String, dynamic> json) =>
			_$UserUpdateRequestFromJson(json);
}
