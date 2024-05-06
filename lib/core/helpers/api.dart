import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:lines/core/env/enviroment.dart';

Environment get environment => Get.find<Environment>();

String get apiEndpoint => environment.apiEndpoint;

String get proxyEndpoint => "${environment.proxy}:9090";
// bool get authTokenPresent => authHeaders.accessToken != null;
bool get isProxymanEnabled => kDebugMode ? environment.enableProxyman : false;
