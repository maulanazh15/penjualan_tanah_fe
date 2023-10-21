import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:penjualan_tanah_fe/blocs/blocs.dart';
import 'package:penjualan_tanah_fe/models/requests/login/login_request.dart';
import 'package:penjualan_tanah_fe/models/requests/register/register_request.dart';
import 'package:penjualan_tanah_fe/repositories/auth/auth_repository.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  final AuthBloc _authBloc;

  LoginCubit({
    required AuthRepository authRepository,
    required AuthBloc authBloc,
  })  : _authRepository = authRepository,
        _authBloc = authBloc,
        super(const LoginState.initial());

  Future<String?> signIn(LoginData data) async {
    final response = await _authRepository.login(
      LoginRequest(
        username: data.name,
        password: data.password,
      ),
    );

    if (response.success) {
      _authBloc.add(
        Authenticated(
          isAuthenticated: true,
          token: response.data!.token,
          user: response.data!.user,
        ),
      );

      return null;
    }

    return response.message;
  }

  Future<String?> signUp(SignupData data) async {
    final response = await _authRepository.register(
      RegisterRequest(
          username: data.name!,
          email: '${data.name!}@gmail.com',
          name: data.name!,
          password: data.password!,
          passwordConfirmation: data.password!),
    );
    if (response.success) {
      _authBloc.add(
        Authenticated(
          isAuthenticated: true,
          token: response.data!.token,
          user: response.data!.user,
        ),
      );

      return null;
    }

    return response.message;
  }

  Future<String?> currentUser() async {
    final response = await _authRepository.currentUser();
    if (response.success) {
      
      return null;
    }

    return response.message;
  }

  Future<void> signOut() async {
    await _authRepository.logout();
    _authBloc.add(
      const Authenticated(
        isAuthenticated: false,
        user: null,
        token: null,
      ),
    );
  }
}
