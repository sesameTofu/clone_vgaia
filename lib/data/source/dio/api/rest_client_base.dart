import 'package:dio/dio.dart';
import 'package:flutter_mobile/config/config.dart';
import 'package:flutter_mobile/data/source/dio/rest_client.dart';

class RestClientBase extends RestClient {
  factory RestClientBase() {
    _singleton ??=
        RestClientBase._internal(AppConfig.config.baseUrl, interceptors: null);
    return _singleton!;
  }

  RestClientBase._internal(String baseUrl, {List<Interceptor>? interceptors})
      : super(baseUrl, interceptors);

  static RestClientBase? _singleton;
}
