import 'package:dio/dio.dart';
import 'package:parking_space/constant/app_constants.dart';
import 'package:parking_space/constant/network_constant.dart';
import 'package:parking_space/core/interceptor/network_interceptor.dart';
import 'package:parking_space/core/networking/network_exception_handler/api_exception.dart';
import 'package:parking_space/interfaces/network_requester_interface.dart';

class ServiceManagerV1 implements NetworkRequesterInterface {
  // Private constructor
  ServiceManagerV1._() {
    prepareRequest();
  }

  static final ServiceManagerV1 _instance =
      ServiceManagerV1._();

  // Getter for the singleton instance
  static ServiceManagerV1 get instance => _instance;

  Dio? _dio;

  @override
  Future<void> prepareRequest() async {

    final BaseOptions baseOptions = BaseOptions(
        connectTimeout: NetworkConstant.connectionTimeout,
        receiveTimeout: NetworkConstant.receiverTimeout,
        baseUrl: AppConstants.baseUrl,
        responseType: ResponseType.json,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': authToken
        });

    _dio = Dio(baseOptions);
    _dio!.interceptors.clear();
    _dio!.interceptors.add(DioApiInterceptor());
    _dio!.interceptors.add(LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        logPrint: _logPrint));
  }

  void _logPrint(Object object) => print(object.toString());

  @override
  Future<dynamic> get(
      {required String path, Map<String, dynamic>? query}) async {
    try {
      final dynamic response = await _dio!.get(path, queryParameters: query);
      return response.data;
    } on Exception catch (exception) {
      return NetworkExceptionHandler.handleError(exception);
    }
  }

  @override
  Future<dynamic> post(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data}) async {
    try {
      final dynamic response =
          await _dio!.post(path, queryParameters: query, data: data);
      return response.data;
    } on Exception catch (exception) {
      return NetworkExceptionHandler.handleError(exception);
    }
  }

  @override
  Future<dynamic> put(
      {required String path, Map<String, dynamic>? query, dynamic data}) async {
    try {
      final dynamic response =
          await _dio!.put(path, queryParameters: query, data: data);
      return response.data;
    } on Exception catch (exception) {
      return NetworkExceptionHandler.handleError(exception);
    }
  }

  @override
  Future<dynamic> patch(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data}) async {
    try {
      final dynamic response =
          await _dio!.patch(path, queryParameters: query, data: data);
      return response.data;
    } on Exception catch (exception) {
      return NetworkExceptionHandler.handleError(exception);
    }
  }

  @override
  Future<dynamic> delete(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data}) async {
    try {
      final dynamic response =
          await _dio!.delete(path, queryParameters: query, data: data);
      return response.data;
    } on Exception catch (exception) {
      return NetworkExceptionHandler.handleError(exception);
    }
  }
}
