import 'package:lines/core/env/enviroment.dart';

class StagingEnv extends Environment {
  @override
  String get apiEndpoint => "https://ceb5-95-228-125-157.ngrok-free.app";

  @override
  bool get enableProxyman => true;

  @override
  String get proxy => '192.168.2.61';
}
