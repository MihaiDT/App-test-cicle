import 'dart:io';

import 'package:flutter/services.dart';

hapticFeedback() => Platform.isAndroid ? HapticFeedback.lightImpact() : HapticFeedback.lightImpact();
