import 'package:dio/dio.dart';

import 'index.dart';

var httpRequest = Dio();

initDio() {
  httpRequest = Dio(
    BaseOptions(baseUrl: Configs.baseUrl),
  );

  httpRequest.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioError error, handler) {
        return handler.next(ApiError(error));
      },
    ),
  );
}

setToken(String token) {
  httpRequest.options.headers['Authorization'] = 'Bearer $token';
}
