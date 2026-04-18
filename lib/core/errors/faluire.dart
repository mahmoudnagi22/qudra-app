import 'package:dio/dio.dart';

abstract class Failure {
  String errorMessage;
  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  static const String _fallbackMessage =
      'Oops, there was an error, please try again';

  // ignore: non_constant_identifier_names
  factory ServerFailure.FromBadResponse(int? statusCode, dynamic response) {
    final extractedMessage = _extractMessage(response);

    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage: extractedMessage ?? _fallbackMessage);
    } else if (statusCode == 404) {
      return ServerFailure(errorMessage: 'Invalid email or password');
    } else if (statusCode == 500) {
      return ServerFailure(
          errorMessage: 'Internal Server error, Please try later');
    } else if (statusCode == 409) {
      return ServerFailure(errorMessage: 'Account already exists');
    } else {
      return ServerFailure(
          errorMessage: 'Opps There was an Error, Please try again');
    }
  }

  ServerFailure({required super.errorMessage});

  static String? _extractMessage(dynamic response) {
    if (response is String && response.trim().isNotEmpty) {
      return response;
    }
    if (response is! Map) {
      return null;
    }

    final dynamic message = response['message'];
    if (message is String && message.trim().isNotEmpty) {
      return message;
    }

    final dynamic title = response['title'];
    if (title is String && title.trim().isNotEmpty) {
      return title;
    }

    final dynamic errors = response['errors'];
    if (errors is Map) {
      final List<String> parts = [];
      for (final dynamic value in errors.values) {
        if (value is List) {
          for (final dynamic item in value) {
            if (item is String && item.trim().isNotEmpty) {
              parts.add(item);
            }
          }
        } else if (value is String && value.trim().isNotEmpty) {
          parts.add(value);
        }
      }
      if (parts.isNotEmpty) {
        return parts.join('\n');
      }
    }

    return null;
  }

  // ignore: non_constant_identifier_names
  factory ServerFailure.FromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: 'Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send timeout with ApiServe');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'Bad certificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.FromBadResponse(
          dioException.response?.statusCode,
          dioException.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'Request to ApiServer was cancel');
      case DioExceptionType.connectionError:
        return ServerFailure(
            errorMessage: 'Connection erorr , please try again!');
      case DioExceptionType.unknown:
        if (dioException.message?.contains('SocketException') ?? false) {
          return ServerFailure(errorMessage: 'No Internet Connection');
        }
        return ServerFailure(
            errorMessage: 'Unexpected Error, Please try again!');
    }
  }
}
