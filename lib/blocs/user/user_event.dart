part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.started() = UserStarted;
  const factory UserEvent.userUpdated({
    String? username,
    String? email,
    XFile? profileImage,
    int? provId,
    int? cityId,
    int? disId,
    int? subDisId,
  }) = UserUpdated;
}
