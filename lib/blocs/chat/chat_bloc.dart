import 'package:bloc/bloc.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:penjualan_tanah_fe/enums/data_status.dart';
import 'package:penjualan_tanah_fe/models/chat_message_model.dart';
import 'package:penjualan_tanah_fe/models/chat_model.dart';
import 'package:penjualan_tanah_fe/models/user_model.dart';
import 'package:penjualan_tanah_fe/repositories/chat/chat_repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _chatRepository;

  ChatBloc({
    required ChatRepository chatRepository,
  })  : _chatRepository = chatRepository,
        super(ChatState.initial()) {
    on<ChatStarted>((event, emit) async {
      if (state.status.isLoading) return;

      emit(state.copyWith(status: DataStatus.loading));

      final result = await _chatRepository.getChats();

      emit(state.copyWith(
        status: DataStatus.loaded,
        chats: result.success ? result.data ?? [] : [],
      ));
    });

    on<ChatReset>((event, emit) {
      emit(ChatState.initial());
    });

    on<UserSelected>((event, emit) {
      emit(state.copyWith(
        otherUserId: event.user.id,
      ));
    });
  }
}
