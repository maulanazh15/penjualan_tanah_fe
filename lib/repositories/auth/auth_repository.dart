import 'package:dio/dio.dart';
import 'package:penjualan_tanah_fe/models/requests/login/login_request.dart';
import 'package:penjualan_tanah_fe/models/requests/register/register_request.dart';
import 'package:penjualan_tanah_fe/repositories/core/endpoints.dart';
import 'package:penjualan_tanah_fe/utils/dio_client/dio_client.dart';
import 'package:penjualan_tanah_fe/models/app_response.dart';
import 'package:penjualan_tanah_fe/models/user_model.dart';
import 'package:penjualan_tanah_fe/repositories/auth/base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  AuthRepository({Dio? dioClient})
      : _dioClient = dioClient ?? DioClient().instance;

  final Dio _dioClient;

  @override
  Future<AppResponse<UserEntity?>> currentUser() async {
    // TODO: implement currentUser
    final response = await _dioClient.get(
      Endpoints.currentUser,
    );
    // print(response);
    return AppResponse<UserEntity?>.fromJson(
      response.data,
      (dynamic json) => response.data['success'] && json != null
          ? UserEntity.fromJson(json['user'])
          : null,
    );
  }

  @override
  Future<AppResponse<AuthUser?>> login(LoginRequest request) async {
    // TODO: implement login
    final response = await _dioClient.post(
      Endpoints.login,
      data: request.toJson(),
    );

    return AppResponse<AuthUser?>.fromJson(
      response.data,
      (dynamic json) => response.data['success'] && json != null
          ? AuthUser.fromJson(json)
          : null,
    );
  }

  @override
  Future<AppResponse> logout() async {
    // TODO: implement logout
    final response = await _dioClient.delete(
      Endpoints.logout,
    );

    return AppResponse.fromJson(
      response.data,
      (dynamic json) => null,
    );
  }

  @override
  Future<AppResponse<AuthUser?>> register(RegisterRequest request) async {
    // TODO: implement register
    final response = await _dioClient.post(
      Endpoints.register,
      data: request.toJson(),
    );


    return AppResponse<AuthUser?>.fromJson(
      response.data,
      (dynamic json) => response.data['success'] && json != null
          ? AuthUser.fromJson(json)
          : null,
    );
  }
}
