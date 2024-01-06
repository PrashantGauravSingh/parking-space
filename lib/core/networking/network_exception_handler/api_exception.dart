import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:parking_space/constant/app_strings.dart';
import 'package:parking_space/core/networking/network_exception_handler/exception_handler.dart';


class NetworkExceptionHandler {
  NetworkExceptionHandler._();

  static APIException handleError(Exception error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.sendTimeout:
          return APIException(message: AppStrings.connectionTimeout);
        case DioExceptionType.receiveTimeout:
          return APIException(message: AppStrings.connectionTimeout);
        case DioExceptionType.connectionError:
          return APIException(message: AppStrings.connectionTimeout);
        case DioExceptionType.connectionTimeout:
          return APIException(message: AppStrings.connectionTimeout);
        case DioExceptionType.unknown:
          if(error.response!.data.runtimeType == String){
            return APIException(
                statusCode:
                ONEAPPResponseModel.fromJson(json.decode(error.response?.data)).statusCode,
                message:
                ONEAPPResponseModel.fromJson(json.decode(error.response?.data)).message ??
                    '');
          }
          return APIException(
              statusCode:
                  ONEAPPResponseModel.fromJson(error.response?.data).statusCode,
              message:
                  ONEAPPResponseModel.fromJson(error.response?.data).message ??
                      '');
        case DioExceptionType.badResponse:
          if(error.response!.data.runtimeType == String){
            return APIException(
                statusCode:
                ONEAPPResponseModel.fromJson(json.decode(error.response?.data)).statusCode,
                message:
                ONEAPPResponseModel.fromJson(json.decode(error.response?.data)).message ??
                    '');
          }
          return APIException(
              statusCode:
                  ONEAPPResponseModel.fromJson(error.response?.data).statusCode,
              message:
                  ONEAPPResponseModel.fromJson(error.response?.data).message ??
                      '');

        default:
          return APIException(message: AppStrings.somethingWentWrong);
      }
    } else {
      return APIException(message: AppStrings.somethingWentWrong);
    }
  }
}
