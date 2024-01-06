import 'dart:async';
import 'dart:io';

class APIException implements Exception {
  APIException({required this.message, this.statusCode});

  final String message;
  final int? statusCode;
}

class ExceptionHandler {
  ExceptionHandler._();

  static APIException handleError(Exception error) {
    if (error is SocketException) {
      return APIException(
        message: error.message,
      );
    } else if (error is TimeoutException) {
      return APIException(message: 'Request Timeout');
    } else if (error is FormatException) {
      return APIException(message: '');
    }
    return APIException(message: 'Something went wrong');
  }
}
