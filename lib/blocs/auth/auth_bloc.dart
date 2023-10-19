import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:penjualan_tanah_fe/models/user_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial()) {
    on<Authenticated>((event, emit) {
      // TODO: implement event handler
      emit(state.copyWith(
        isAuthenticated: event.isAuthenticated,
        user: event.user,
        token: event.token,
      ));
    });
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return AuthState(
        isAuthenticated: json['isAuthenticated'],
        token: json['token'],
        user: json['user'] != null ? UserEntity.fromJson(json['user']) : null);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    // TODO: implement toJson
    return {
      'isAuthenticated': state.isAuthenticated,
      'token': state.token,
      'user': state.user != null ? state.user!.toJson() : null,
    };
  }
}
