import 'package:lines/core/env/enviroment.dart';

class StagingEnv extends Environment {
  @override
  String get apiEndpoint => "https://staging.lines-test.advicelab.io";

  //"https://lines-api.tandu.it";

  @override
  bool get enableProxyman => false;

  @override
  String get gameEndpoint => 'https://tinybullstudios.com/Lines/Tamagotchi';

  @override
  String get cherryCustomizationEndpoint =>
      'https://tinybullstudios.com/Lines/Customization';

  @override
  String get proxy => '192.168.2.61';

  @override
  Map<String, String> get piwik => {
        'baseUrl': '8e6de72e-4541-41ea-b092-66de3e3aaf2b',
        'siteId': 'https://fater.piwik.pro',
      };
}
