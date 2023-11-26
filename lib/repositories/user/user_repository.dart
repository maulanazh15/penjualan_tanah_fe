import 'package:image_picker/image_picker.dart';
import 'package:penjualan_tanah_fe/models/requests/user_update/user_update_request.dart';

import '../../models/app_response.dart';
import '../../models/user_model.dart';

abstract class BaseUserRepository {
  Future<AppResponse<List<UserEntity>>> getUsers();
  Future<AppResponse<UserEntity>> updateUser(
      UserUpdateRequest request, XFile? profileImage);
  Future<AppResponse<UserEntity>> otherUser(int $id);
}
