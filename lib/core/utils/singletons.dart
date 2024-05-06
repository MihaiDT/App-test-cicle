import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lines/app_controller.dart';
import 'package:lines/core/helpers/logger/logger.dart';

final dio = Get.find<Dio>();
final log = Get.find<CustomLogger>();

final appController = Get.find<AppController>();
