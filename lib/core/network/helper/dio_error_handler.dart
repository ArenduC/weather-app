import 'dart:io';
import 'package:dio/dio.dart';
import 'package:weather_app/core/network/models/failure.dart';

class DioErrorHandler {
  static Failure handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return const TimeoutFailure("Connection timed out");

        case DioExceptionType.badResponse:
          return ServerFailure(
              "Server error: ${error.response?.statusCode}");

        case DioExceptionType.connectionError:
          return const NetworkFailure("No Internet Connection");

        case DioExceptionType.unknown:
          if (error.error is SocketException) {
            return const NetworkFailure("No Internet Connection");
          }
          return const UnknownFailure("Unexpected error occurred");

        default:
          return const UnknownFailure("Unexpected error occurred");
      }
    }

    if (error is SocketException) {
      return const NetworkFailure("No Internet Connection");
    }

    return const UnknownFailure("Unexpected error occurred");
  }
}
