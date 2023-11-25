import 'package:dio/dio.dart';
import 'package:penjualan_tanah_fe/repositories/core/endpoints.dart';

import '../../models/location_model.dart';
import '../../utils/dio_client/dio_client.dart';
import '../../utils/logger.dart';

class LocationRepository {
  final Dio _dioClient;

  LocationRepository({
    Dio? dioClient,
  }) : _dioClient = dioClient ?? DioClient().instance;

  Future<List<Province>?> fetchDataProvinces() async {
    // Replace with your API endpoint URL
    List<Province> provinces = [];
    try {
      final response = await _dioClient.get(Endpoints.getProvinces);
      if (response.data['success'] && response.data['data'] != null) {
        provinces = (response.data['data'] as List<dynamic>)
            .map((e) => Province.fromJson(e))
            .toList();
        // iLog(provinces![0].provName);
        return provinces;
      }
      return provinces;
    } catch (error) {
      eLog(error);
      throw Exception('Error: $error');
    }
  }

  Future<List<City>?> fetchDataCities(int id) async {
    // Replace with your API endpoint URL
    List<City> cities = [];
    try {
      final response =
          await _dioClient.get("${Endpoints.baseLocation}/province/$id/cities");
      if (response.data['success'] && response.data['data'] != null) {
        cities = (response.data['data'] as List<dynamic>)
            .map((e) => City.fromJson(e))
            .toList();
        // iLog(provinces![0].provName);
        return cities;
      }
      return cities;
    } catch (error) {
      eLog(error);
      throw Exception('Error: $error');
    }
  }

  Future<List<District>?> fetchDataDistricts(int id) async {
    // Replace with your API endpoint URL
    List<District> districts = [];
    try {
      final response =
          await _dioClient.get("${Endpoints.baseLocation}/city/$id/districts");
      if (response.data['success'] && response.data['data'] != null) {
        districts = (response.data['data'] as List<dynamic>)
            .map((e) => District.fromJson(e))
            .toList();
        // iLog(provinces![0].provName);
        return districts;
      }
      return districts;
    } catch (error) {
      eLog(error);
      throw Exception('Error: $error');
    }
  }

  Future<List<SubDistrict>?> fetchDataSubDistricts(int id) async {
    // Replace with your API endpoint URL
    List<SubDistrict> subDistricts = [];
    try {
      final response = await _dioClient
          .get("${Endpoints.baseLocation}/district/$id/subdistricts");
      if (response.data['success'] && response.data['data'] != null) {
        subDistricts = (response.data['data'] as List<dynamic>)
            .map((e) => SubDistrict.fromJson(e))
            .toList();
        // iLog(provinces![0].provName);
        return subDistricts;
      }
      return subDistricts;
    } catch (error) {
      eLog(error);
      throw Exception('Error: $error');
    }
  }

  Future<LocationData> fetchDataLocation(int id) async {
    // Replace with your API endpoint URL
    LocationData locationData = LocationData.defaultLocation();
    try {
      final response = await _dioClient.get("${Endpoints.baseLocation}/$id");
      if (response.data['success'] && response.data['data'] != null) {
        locationData = LocationData.fromJson(response.data['data']);
        return locationData;
      }
      return locationData;
    } catch (error) {
      eLog(error);
      throw Exception('Error: $error');
    }
  }
}
