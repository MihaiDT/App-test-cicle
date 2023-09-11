import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../../data/models/app_config.dart';

final dio = Get.find<Dio>();
final env = DotEnv();
final appConfig = Get.find<AppConfig>();
