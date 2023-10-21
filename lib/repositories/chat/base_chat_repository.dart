import 'package:penjualan_tanah_fe/models/models.dart';
import 'package:penjualan_tanah_fe/models/requests/requests.dart';

abstract class BaseChatRepository {
  Future<AppResponse<List<ChatEntity>>> getChats();

  Future<AppResponse<ChatEntity?>> createChat(CreateChatRequest request);
  
  Future<AppResponse<ChatEntity?>> getSingleChat(int chatId);

}
