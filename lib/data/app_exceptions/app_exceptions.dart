import 'dart:io';

import '../../resource/strings_manager.dart';

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaults
}

class ResponseCode {
  // API status codes
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no content
  static const int badRequest = 400; // failure, api rejected the request
  static const int forbidden = 403; // failure, api rejected the request
  static const int unauthorised = 401; // failure user is not authorised
  static const int notFound =
      404; // failure, api url is not correct and not found
  static const int internalServerError =
      500; // failure, crash happened in server side

  // local status code
  static const int defaults = -1;
  static const int connectTimeout = -2;
  static const int cancel = -3;
  static const int receiveTimeout = -4;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;
}

class ResponseMessage {
  // API status codes
  // API response codes
  static const String success = StringManager.success; // success with data
  static const String noContent =
      StringManager.noContent; // success with no content
  static const String badRequest =
      StringManager.badRequestError; // failure, api rejected our request
  static const String forbidden =
      StringManager.forbiddenError; // failure,  api rejected our request
  static const String unauthorised =
      StringManager.unauthorizedError; // failure, user is not authorised
  static const String notFound = StringManager
      .notFoundError; // failure, API url is not correct and not found in api side.
  static const String internalServerError = StringManager
      .internalServerError; // failure, a crash happened in API side.

  // local responses codes
  static const String defaults =
      StringManager.defaultError; // unknown error happened
  static const String connectTimeout =
      StringManager.timeoutError; // issue in connectivity
  static const String cancel =
      StringManager.defaultError; // API request was cancelled
  static const String receiveTimeout =
      StringManager.timeoutError; //  issue in connectivity
  static const String sendTimeout =
      StringManager.timeoutError; //  issue in connectivity
  static const String cacheError = StringManager
      .defaultError; //  issue in getting data from local data source (cache)
  static const String noInternetConnection =
      StringManager.noInternetError; // issue in connectivity
}

class Failure {
  int code; // 200 or 400
  bool status; // 200 or 400
  String message; // error or success
  Failure(this.code, this.message, this.status);
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return Failure(
            ResponseCode.badRequest, ResponseMessage.badRequest.trim(), false);
      case DataSource.forbidden:
        return Failure(
            ResponseCode.forbidden, ResponseMessage.forbidden.trim(), false);
      case DataSource.unauthorised:
        return Failure(ResponseCode.unauthorised,
            ResponseMessage.unauthorised.trim(), false);
      case DataSource.notFound:
        return Failure(
            ResponseCode.notFound, ResponseMessage.notFound.trim(), false);
      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError.trim(), false);
      case DataSource.connectTimeout:
        return Failure(ResponseCode.connectTimeout,
            ResponseMessage.connectTimeout.trim(), false);
      case DataSource.cancel:
        return Failure(
            ResponseCode.cancel, ResponseMessage.cancel.trim(), false);
      case DataSource.receiveTimeout:
        return Failure(ResponseCode.receiveTimeout,
            ResponseMessage.receiveTimeout.trim(), false);
      case DataSource.sendTimeout:
        return Failure(ResponseCode.sendTimeout,
            ResponseMessage.sendTimeout.trim(), false);
      case DataSource.cacheError:
        return Failure(
            ResponseCode.cacheError, ResponseMessage.cacheError.trim(), false);
      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection.trim(), false);
      case DataSource.defaults:
        return Failure(ResponseCode.defaults, ResponseMessage.defaults, false);
      default:
        return Failure(ResponseCode.defaults, ResponseMessage.defaults, false);
    }
  }
}

class AppExceptions implements Exception {
  late Failure failure;

  AppExceptions.handle(dynamic error) {
    if (error is HttpResponse) {
      failure = _handleException(error);
    } else {
      failure = DataSource.defaults.getFailure();
    }
  }

  Failure _handleException(HttpResponse error) {
    switch (error.statusCode) {
      case ResponseCode.connectTimeout:
        return DataSource.connectTimeout.getFailure();
      case ResponseCode.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case ResponseCode.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case ResponseCode.badRequest:
        return DataSource.badRequest.getFailure();
      case ResponseCode.forbidden:
        return DataSource.forbidden.getFailure();
      case ResponseCode.unauthorised:
        return DataSource.unauthorised.getFailure();
      case ResponseCode.notFound:
        return DataSource.notFound.getFailure();
      case ResponseCode.internalServerError:
        return DataSource.internalServerError.getFailure();
      case ResponseCode.cancel:
        return DataSource.cancel.getFailure();
      default:
        return DataSource.defaults.getFailure();
    }
  }
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
