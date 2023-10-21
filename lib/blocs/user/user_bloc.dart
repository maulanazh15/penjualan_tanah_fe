import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:penjualan_tanah_fe/repositories/user/base_user_repository.dart';

import '../../models/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  

  UserBloc({
    required UserRepository userRepository,
  }) : _userRepository = userRepository, super(const _Initial()) {
    on<UserStarted>((event, emit) async {
      // TODO: implement event handler
      final result = await _userRepository.getUsers();
      emit(Loaded(result.data ?? []));
    });
  }
}
