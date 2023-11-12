part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.started() = UserStarted;
  const factory UserEvent.userUpdated(
    {
    required String username,
    required String email,
    XFile? profileImage,
    }
    ) = UserUpdated;
}
