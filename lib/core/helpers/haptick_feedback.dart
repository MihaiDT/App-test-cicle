import 'dart:io';

import 'package:flutter/services.dart';

hapticFeedback() => Platform.isAndroid ? HapticFeedback.heavyImpact() : HapticFeedback.selectionClick();
