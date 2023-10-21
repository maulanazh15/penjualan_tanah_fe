import 'package:dio/dio.dart';
import 'package:penjualan_tanah_fe/models/requests/requests.dart';
import 'package:penjualan_tanah_fe/repositories/core/endpoints.dart';
import 'package:penjualan_tanah_fe/utils/dio_client/dio_client.dart';
import 'package:penjualan_tanah_fe/models/app_response.dart';
import 'package:penjualan_tanah_fe/models/chat_model.dart';
import 'package:penjualan_tanah_fe/repositories/chat/base_chat_repository.dart';

class ChatRepository extends BaseChatRepository {
  ChatRepository({
    Dio? dioClient,
  }) : _dioClient = dioClient ?? DioClient().instance;

  final Dio _dioClient;

  @override
  Future<AppResponse<ChatEntity?>> createChat(CreateChatRequest request) async {
    // TODO: implement createChat
    final response = await _dioClient.post(
      Endpoints.createChat,
      data: request.toJson(),
    );

    return AppResponse<ChatEntity?>.fromJson(
        response.data,
        (dynamic json) => response.data['success'] && json != null
            ? ChatEntity.fromJson(json)
            : null);
  }

  @override
  Future<AppResponse<List<ChatEntity>>> getChats() async {
    // TODO: implement getChats
    final response = await _dioClient.get(Endpoints.getChats);

    return AppResponse<List<ChatEntity>>.fromJson(
        response.data,
        (json) => response.data['success'] && json != null
            ? (json as List<dynamic>)
                .map((e) => ChatEntity.fromJson(e))
                .toList()
            : []);
  }

  @override
  Future<AppResponse<ChatEntity?>> getSingleChat(int chatId) async {
    // TODO: implement getSingleChat
    final response = await _dioClient.get("${Endpoints.getSingleChat}$chatId");

    return AppResponse<ChatEntity?>.fromJson(
        response.data,
        (dynamic json) => response.data['success'] && json != null
            ? ChatEntity.fromJson(json)
            : null);

  }
}
