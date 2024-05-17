import 'package:injectable/injectable.dart';

import '../../model/country/country.dart';
import '../../model/language/language.dart';
import '../api_endpoints.dart';
import '../dio/dio_client.dart';

abstract class FilterRepository {
  Future<List<Language>> getLanguages();
  Future<List<Country>> getCountries();
}

@LazySingleton(as: FilterRepository)
class FilterRepositoryImpl implements FilterRepository {
  FilterRepositoryImpl(this._dio);

  final DioClient _dio;

  @override
  Future<List<Language>> getLanguages() async {
    final response = await _dio.get(ApiEndpoints.getLanguages());
    return (response.data as List<dynamic>)
        .map(
          (station) => Language.fromJson(station as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<List<Country>> getCountries() async {
    final response = await _dio.get(ApiEndpoints.getCountries());
    return (response.data as List<dynamic>)
        .map(
          (station) => Country.fromJson(station as Map<String, dynamic>),
        )
        .toList();
  }
}
