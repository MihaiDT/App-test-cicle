import 'package:lines/core/env/enviroment.dart';

class ProdEnv extends Environment {
  @override
  String get apiEndpoint => "https://lines.advicelab.io";

  @override
  bool get enableProxyman => false;

  @override
  String get gameEndpoint =>
      'https://learnie-lines-production.s3.eu-south-1.amazonaws.com/game';

  @override
  String get cherryCustomizationEndpoint =>
      'https://learnie-lines-production.s3.eu-south-1.amazonaws.com/conf_avatar';

  @override
  String get proxy => "10.130.16.130";

  // FIXME: ?
  @override
  Map<String, String> get piwik => {
        'baseUrl': '172e3eb8-e25f-4a2e-ad55-004c93e3026d',
        'siteId': 'https://fater.piwik.pro',
      };
}
