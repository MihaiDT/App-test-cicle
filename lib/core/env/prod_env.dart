import 'package:lines/core/env/enviroment.dart';

class ProdEnv extends Environment {
  @override
  String get apiEndpoint => "https://lines-api.tandu.it";

  @override
  bool get enableProxyman => false;

  @override
  String get gameEndpoint => 'https://tinybullstudios.com/Lines/Tamagotchi';

  @override
  String get cherryCustomizationEndpoint => 'https://tinybullstudios.com/Lines/Customization';

  @override
  String get proxy => "192.168.1.4";
}
