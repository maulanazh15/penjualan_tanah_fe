import '../../models/app_response.dart';
import '../../models/chat_message_model.dart';
import '../../models/requests/create_chat_message/create_chat_message_request.dart';

abstract class BaseChatMessagaRepository {
  Future<AppResponse<List<ChatMessageEntity>>> getChatMessages({
    required int chatId,
    required int page,
  });

  Future<AppResponse<ChatMessageEntity?>> createChatMessage(
    CreateChatMessageRequest request,
    // String socketId,
  );
}