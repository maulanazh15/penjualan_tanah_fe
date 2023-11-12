import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:penjualan_tanah_fe/blocs/auth/auth_bloc.dart';
import 'package:penjualan_tanah_fe/models/app_response.dart';
import 'package:penjualan_tanah_fe/models/requests/user_update/user_update_request.dart';
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

  @override
  Future<AppResponse<UserEntity>> updateUser(
    UserUpdateRequest request,
    XFile? profileImage,
  ) async {
    // TODO: implement updateUser
    String fileName = profileImage!.path.split('/').last;
    FormData formData = FormData.fromMap({
      "username": request.username,
      "email": request.email,
      "photo_profile": await MultipartFile.fromFile(profileImage.path, filename: fileName)
    });
    final response = await _dioClient.post(
      Endpoints.updateUserProfile,
      data: formData,
    );

    return AppResponse<UserEntity>.fromJson(response.data, (dynamic json) {
      if (response.data['success'] && json != null) {
        return UserEntity.fromJson(json);
      }
      return AuthBloc().state.user!;
    });
  }
}
