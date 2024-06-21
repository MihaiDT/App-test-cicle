import 'package:lines/core/env/enviroment.dart';

class StagingEnv extends Environment {
  @override
  String get apiEndpoint => "https://staging.lines-test.advicelab.io";

  //"https://lines-api.tandu.it";

  @override
  bool get enableProxyman => false;

  @override
  String get gameEndpoint =>
      'https://learnie-lines-test.s3.eu-south-1.amazonaws.com/game';

  @override
  String get cherryCustomizationEndpoint =>
      'https://learnie-lines-test.s3.eu-south-1.amazonaws.com/conf_avatar';

  @override
  String get proxy => '192.168.2.61';

  @override
  Map<String, String> get piwik => {
        'baseUrl': '8e6de72e-4541-41ea-b092-66de3e3aaf2b',
        'siteId': 'https://fater.piwik.pro',
      };
}
