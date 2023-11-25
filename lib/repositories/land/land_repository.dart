import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:penjualan_tanah_fe/models/land_model.dart';
import 'package:penjualan_tanah_fe/repositories/core/endpoints.dart';
import 'package:penjualan_tanah_fe/utils/utils.dart';

import '../../models/app_response.dart';
import '../../utils/logger.dart';

class LandRepository {
  final Dio _dioClient;

  LandRepository({
    Dio? dioClient,
  }) : _dioClient = dioClient ?? DioClient().instance;

  Future<AppResponse<List<LandModel>>> getLands() async {
    try {
      final response = await _dioClient.get(Endpoints.baseLand);
      iLog(response.data!);
      return AppResponse<List<LandModel>>.fromJson(
        response.data,
        (dynamic json) {
          if (response.data['success'] && json != null) {
            return (json as List<dynamic>)
                .map((e) => LandModel.fromJson(e))
                .toList();
          }
          return [];
        },
      );
    } catch (e) {
      print('Error fetching lands: $e');
      throw Exception('Failed to load lands');
    }
  }
  Future<AppResponse<List<LandModel>>> getUserLands() async {
    try {
      final response = await _dioClient.get(Endpoints.getUserLands);
      // iLog(response.data!);
      return AppResponse<List<LandModel>>.fromJson(
        response.data,
        (dynamic json) {
          if (response.data['success'] && json != null) {
            return (json as List<dynamic>)
                .map((e) => LandModel.fromJson(e))
                .toList();
          }
          return [];
        },
      );
    } catch (e) {
      print('Error fetching lands: $e');
      throw Exception('Failed to load lands');
    }
  }

  Future<AppResponse<LandModel>> createLand(
      Map<String, dynamic> landData, XFile? landPic) async {
    try {
      if (landPic != null) {
        String fileName = landPic.path.split('/').last;
        landData.addAll({
          "foto_tanah":
              await MultipartFile.fromFile(landPic.path, filename: fileName)
        });
      }
      FormData formData = FormData.fromMap(landData);
      final response = await _dioClient.post(
        Endpoints.baseLand,
        data: formData,
      );
      // iLog(response.data);
      return AppResponse<LandModel>.fromJson(
        response.data,
        (dynamic json) {
          if (response.data['success'] && json != null) {
            return LandModel.fromJson(json);
          }
          throw Exception('Failed to create land');
        },
      );
    } catch (e) {
      print('Error creating land: $e');
      throw Exception('Failed to create land');
    }
  }

  Future<AppResponse<LandModel>> updateLand(
      int landId, Map<String, dynamic> landData, XFile? landPic) async {
    try {
      if (landPic != null) {
        String fileName = landPic.path.split('/').last;
        landData.addAll({
          "foto_tanah":
              await MultipartFile.fromFile(landPic.path, filename: fileName)
        });
      }
      FormData formData = FormData.fromMap(landData);
      final response = await _dioClient.post(
        "${Endpoints.baseLand}/$landId",
        data: formData,
      );
      // iLog(response.data);
      return AppResponse<LandModel>.fromJson(
        response.data,
        (dynamic json) {
          if (response.data['success'] && json != null) {
            return LandModel.fromJson(json);
          }
          throw Exception('Failed to create land');
        },
      );
    } catch (e) {
      print('Error updating land: $e');
      throw Exception('Failed to update land');
    }
  }

  Future<AppResponse<void>> deleteLand(int landId) async {
    try {
      final response =
          await _dioClient.delete('${Endpoints.baseLand}/$landId');

      return AppResponse<void>.fromJson(
        response.data,
        (_) {
          if (response.data['success']) {
            return null;
          }
          throw Exception('Failed to delete land');
        },
      );
    } catch (e) {
      print('Error deleting land: $e');
      throw Exception('Failed to delete land');
    }
  }
}
