import 'package:bloc/bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:penjualan_tanah_fe/blocs/auth/auth_bloc.dart';
import 'package:penjualan_tanah_fe/blocs/chat/chat_bloc.dart';
import 'package:penjualan_tanah_fe/models/requests/user_update/user_update_request.dart';
import 'package:penjualan_tanah_fe/repositories/auth/auth_repository.dart';
import 'package:penjualan_tanah_fe/repositories/user/base_user_repository.dart';

import '../../models/user_model.dart';
import '../../utils/logger.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  UserBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(UserState.initial()) {
    on<UserStarted>((event, emit) async {
      // TODO: implement event handler
      final result = await _userRepository.getUsers();
      emit(Loaded(result.data ?? []));
    });

    on<UserUpdated>((event, emit) async {
      final result = await _userRepository.updateUser(
          UserUpdateRequest(username: event.username, email: event.email), event.profileImage );
      eLog(result);
      if (result.success) {
        final authBloc = AuthBloc();
        authBloc.add(Authenticated(
            isAuthenticated: true,
            token: authBloc.state.token,
            user: result.data));
        iLog(authBloc.state.user);
      }
    });
  }
}
