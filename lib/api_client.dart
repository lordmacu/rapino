import 'dart:developer';

import "package:dio/dio.dart";

class Client {
  Dio init() {
    Dio _dio =  Dio();
    _dio.interceptors.add( ApiInterceptors());

    _dio.options.baseUrl =
        "https://us-central1-adomi-dev.cloudfunctions.net/core/api/v1";
    _dio.options.headers["Authorization"] =
        '';
    _dio.options.headers["Accept"] = "application/json";

    return _dio;
  }
}

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print(options.uri);
    print(options.headers);
    print(options.data);
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print("url :  ${err.requestOptions.uri}");
    print("headers : ${err.requestOptions.headers} ");
    print("method : ${err.requestOptions.method} ");
    print("erro : ${err.error} ");
    print("erro : ${err.message} ");
    super.onError(err, handler);

    throw  Exception(err.response);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("url : ${response.requestOptions.uri}");
    log("ok : ${response}");
    return super.onResponse(response, handler);
  }
}
