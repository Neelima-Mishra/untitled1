import 'package:flutter/material.dart';
import '../network/app_logger_util.dart';
import '../network/http_factory.dart';
import '../network/network_urls.dart';
import '../request/request.dart';

String endPoint = '/rafia.json';
String token = '';

@immutable
abstract class RemoteDataSource {
  Future<dynamic> getTop(TopRequest tourRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final HTTPFactory httpFactory;

  RemoteDataSourceImplementer({required this.httpFactory});

  @override
  Future<dynamic> getTop(TopRequest tourRequest) async {
    Map bodyData = {};
    try {
      LoggerUtil.instance.printLog(
          msg:
              "URL of Get Method ${NetworkUrls.getTopData}?page=${tourRequest.page}");
      dynamic response = await httpFactory.get(
          url: "${NetworkUrls.getTopData}?page=${tourRequest.page}",
          parameters: null,
          jsonBody: bodyData);
      LoggerUtil.instance.printLog(msg: "AllRepoImp login api --> $response");
      return response;
    } catch (e) {
      LoggerUtil.instance.printLog(msg: "AllRepoImp login api throw--> $e ");
      rethrow;
    }
  }
}
