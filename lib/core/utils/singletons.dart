import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lines/app_controller.dart';
import 'package:lines/core/helpers/logger/logger.dart';

import '../../data/models/app_config.dart';

final dio = Get.find<Dio>();
final log = Get.find<CustomLogger>();
final appConfig = Get.find<AppConfig>();

final appController = Get.find<AppController>();
