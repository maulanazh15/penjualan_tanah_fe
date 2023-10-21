import 'package:dio/dio.dart';
import 'package:penjualan_tanah_fe/models/app_response.dart';
import 'package:penjualan_tanah_fe/models/user_model.dart';
import 'package:penjualan_tanah_fe/repositories/user/user_repository.dart';

import '../../utils/dio_client/dio_client.dart';
import '../core/endpoints.dart';

class UserRepository extends BaseUserRepository {
  
  
  final Dio _dioClient;

  UserRepository({
    Dio? dioClient,
  }) : _dioClient = dioClient ?? DioClient().instance;

  @override
  Future<AppResponse<List<UserEntity>>> getUsers() async {
    final response = await _dioClient.get(Endpoints.getUsers);

    return AppResponse<List<UserEntity>>.fromJson(
      response.data,
      (dynamic json) {
        if (response.data['success'] && json != null) {
          return (json as List<dynamic>)
              .map((e) => UserEntity.fromJson(e))
              .toList();
        }
        return [];
      },
    );
  }

}