import 'package:dio/dio.dart';

///This class will handle dio interceptor part
class DioApiInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Authorization'] =
        await OneAppUtilities.fetchTokenWithRefresh();
    return handler.next(options);
  }
}
