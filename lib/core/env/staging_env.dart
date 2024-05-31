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
  String get proxy => '192.168.2.61';
}
