import '../../app/app_config.dart';

class NetworkUrls {
  static var baseURL = ConstantEnvironment.baseUrl;

  static var getTopData =
      "http://stagingauth.desidime.com/v4/home/discussed?per_page=10&page=1&fields=id,created_at,created_at_in_millis,image_medium,comments_count,store{name}";
}
