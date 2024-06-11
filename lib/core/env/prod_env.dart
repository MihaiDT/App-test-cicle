import 'package:lines/core/env/enviroment.dart';

class ProdEnv extends Environment {
  @override
  String get apiEndpoint => "https://lines-api.tandu.it";

  @override
  bool get enableProxyman => false;

  @override
  String get gameEndpoint => 'https://tinybullstudios.com/Lines/Tamagotchi';

  @override
  String get cherryCustomizationEndpoint =>
      'https://tinybullstudios.com/Lines/Customization';

  @override
  String get proxy => "192.168.1.4";

  @override
  Map<String, String> get piwik => {
        'baseUrl': '172e3eb8-e25f-4a2e-ad55-004c93e3026d',
        'siteId': 'https://fater.piwik.pro',
      };
}
