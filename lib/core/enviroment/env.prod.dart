import 'package:envied/envied.dart';

part 'env.prod.g.dart';

@Envied(path: ".env.prod")
abstract class Env {
  @EnviedField(varName: "API_ENDPOINT")
  static const String apiEndpoint = _Env.apiEndpoint;
  @EnviedField(varName: "ENABLE_PROXYMAN")
  static const bool enableProxyman = _Env.enableProxyman;
  @EnviedField(varName: "PROXY")
  static const String proxy = _Env.proxy;
}
