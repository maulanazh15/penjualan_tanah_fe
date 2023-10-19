import 'package:penjualan_tanah_fe/models/models.dart';
import 'package:penjualan_tanah_fe/models/requests/requests.dart';

abstract class BaseAuthRepository {
  Future<AppResponse<AuthUser?>> register(RegisterRequest request);

  Future<AppResponse<AuthUser?>> login(LoginRequest request);

  Future<AppResponse<UserEntity?>> currentUser();

  Future<AppResponse> logout();
}
