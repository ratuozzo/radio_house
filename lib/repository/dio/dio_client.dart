import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:injectable/injectable.dart';

import '../../app/flavor_config.dart';

@LazySingleton()
class DioClient extends DioForNative {
  DioClient() {
    options = BaseOptions(
      contentType: 'application/json',
      headers: <String, String>{'Accept': 'application/json'},
      baseUrl: FlavorConfig.instance.values.baseUrl,
    );
    interceptors.addAll(
      [
        LoggyDioInterceptor(requestBody: true),
      ],
    );
  }
}
