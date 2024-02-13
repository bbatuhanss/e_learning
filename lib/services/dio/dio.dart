import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:e_learning_app/services/http/http_exceptions.dart';


String url = "https://restcountries.com/v3.1/";
Random random = Random();

class ApiInterceptor implements InterceptorsWrapper {

  ApiInterceptor(this.token);
  final String token;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Cache-Control"] = "no-cache";
    options.headers["Content-Type"] = "application/json";
    options.headers["Authorization"] = "Bearer $token";
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler){
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    throwForStatusCodeIfNecessary(err.response!.statusCode!, err.response?.data);
    handler.next(err);
  }
}


class ServiceDio {
  ServiceDio._internal() {
    apiInterceptor = ApiInterceptor("");
    dio.interceptors.add(apiInterceptor);
  }

  factory ServiceDio() => _singleton;
  late final dio = Dio();
  static final ServiceDio _singleton = ServiceDio._internal();
  late ApiInterceptor apiInterceptor;
  String token = "";

  Future<Response> get(String uri) async {
    if(uri.contains("?") == true){
      uri = "$uri&clearCacheParam=${random.nextInt(99999999)}";
    } else {
      uri = "$uri?clearCacheParam=${random.nextInt(99999999)}";
    }
    return dio.get(url + uri);
  }

  Future<Response> post(String uri, Object body) async {
    return dio.post(url + uri, data: jsonEncode(body));
  }

  Future<Response> put(String uri, Object body) async {
    return dio.put(url + uri, data: jsonEncode(body));
  }

  Future<Response> delete(String uri) async {
    return dio.delete(url + uri);
  }

}


