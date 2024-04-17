import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../app/app_config.dart';
import '../../app/di.dart';
import '../../domain/models/user_login_model.dart';
import 'app_logger_util.dart';

const String applicationJson = "application/json";
const String accept = "Accept";
const String authorization = "Authorization";

class HTTPFactory {
  UserData userModelData = instance.get<UserData>();

  /// GET CALL
  Future<dynamic> get({
    String? paramValue = "",
    required String url,
    dynamic parameters,
    dynamic jsonBody,
    String? token,
  }) async {
    Map<String, String>? header;
    try {
      if (userModelData.accessToken!.isNotEmpty) {
        header = {
          accept: applicationJson,
          "X-Desidime-Client": "08b4260e5585f282d1bd9d085e743fd9",
        };
      } else {
        header = {
          accept: applicationJson,
          "X-Desidime-Client": "08b4260e5585f282d1bd9d085e743fd9",
        };
      }
      LoggerUtil.instance.printLog(msg: 'Get method url : $url');
      final response = await http.get(Uri.parse(url), headers: header);
      LoggerUtil.instance.printLog(msg: 'Get Response: ${response.body}');
      return response.body;
    } catch (e) {
      LoggerUtil.instance.printLog(msg: 'Something went wrong : $e');
    }
  }
}