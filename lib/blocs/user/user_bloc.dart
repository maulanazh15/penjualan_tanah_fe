import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:penjualan_tanah_fe/blocs/auth/auth_bloc.dart';
import 'package:penjualan_tanah_fe/models/requests/user_update/user_update_request.dart';
import 'package:penjualan_tanah_fe/repositories/user/base_user_repository.dart';

import '../../models/user_model.dart';
import '../../utils/logger.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  final AuthBloc _authBloc;
  UserBloc({
    required UserRepository userRepository,
    required AuthBloc authBloc,
  })  : _userRepository = userRepository,
        _authBloc = authBloc,
        super(const UserState.initial()) {
    on<UserStarted>((event, emit) async {
      // TODO: implement event handler
      final result = await _userRepository.getUsers();
      emit(Loaded(result.data ?? []));
    });

    on<UserUpdated>((event, emit) async {
      final result = await _userRepository.updateUser(
          UserUpdateRequest(
            username: event.username, 
            email: event.email,
            provId: event.provId,
            cityId: event.cityId,
            disId: event.disId,
            subDisId: event.subDisId,
            ),
          event.profileImage);
      eLog(result);
      if (result.success) {
        _authBloc.add(Authenticated(
            isAuthenticated: true,
            token: _authBloc.state.token,
            user: result.data));
        iLog(_authBloc.state.user);
      }
    });
  }
}
