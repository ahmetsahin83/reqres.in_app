import 'package:voco/export/package_exports.dart';
import 'package:voco/export/service_exports.dart';
import 'package:voco/export/view_exports.dart';

class Api {
  String token = "";
  static BaseOptions options = BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
    validateStatus: (status) => status! < 500,
  );
  static Dio dio = Dio(options)..interceptors.add(Interceptor());
  static const baseUrl = "https://reqres.in";
  static const login = "/api/login";
  static const users = "/api/users";
}

class Interceptor extends LogInterceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final Api api = locator<Api>();
    options.headers["Authorization"] = "Bearer ${api.token}";
    debugPrint("REQUEST[${options.method}] => PATH: ${options.path}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        "RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}");
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
        "ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
    return super.onError(err, handler);
  }
}
