import 'package:injectable/injectable.dart';

import '../../model/station/station.dart';
import '../api_endpoints.dart';
import '../dio/dio_client.dart';

abstract class StationRepository {
  Future<List<Station>> getStations();
  Future<List<Station>> searchStations({
    required String query,
  });
  Future<List<Station>> getStationsByLanguage({required String language});
  Future<List<Station>> getStationsByCountry({required String country});
}

@LazySingleton(as: StationRepository)
class StationRepositoryImpl implements StationRepository {
  StationRepositoryImpl(this._dio);

  final DioClient _dio;

  @override
  Future<List<Station>> getStations() async {
    final response = await _dio.get(ApiEndpoints.getStations());
    return (response.data as List<dynamic>)
        .map(
          (station) => Station.fromJson(station as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<List<Station>> searchStations({
    required String query,
  }) async {
    final response = await _dio.get(ApiEndpoints.searchStations(query: query));
    return (response.data as List<dynamic>)
        .map(
          (station) => Station.fromJson(station as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<List<Station>> getStationsByLanguage({
    required String language,
  }) async {
    final response =
        await _dio.get(ApiEndpoints.getStationsByLanguage(language: language));
    return (response.data as List<dynamic>)
        .map(
          (station) => Station.fromJson(station as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<List<Station>> getStationsByCountry({
    required String country,
  }) async {
    final response =
        await _dio.get(ApiEndpoints.getStationsByCountry(country: country));
    return (response.data as List<dynamic>)
        .map(
          (station) => Station.fromJson(station as Map<String, dynamic>),
        )
        .toList();
  }
}
