import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lines/app_controller.dart';

import '../../data/models/app_config.dart';

final dio = Get.find<Dio>();
final appConfig = Get.find<AppConfig>();

final appController = Get.find<AppController>();
