import 'package:get/get.dart';

/// Device connected (Wi-fi or Cellular)
final RxBool _isDeviceConnected = true.obs;
bool get isDeviceConnected => _isDeviceConnected.value;
set isDeviceConnected(bool newValue) => _isDeviceConnected.value = newValue;
