import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

import '../../data/log_levels.dart';

logDebug(
  String msg, {
  DateTime? time,
  String tag = '',
}) {
  _formatLog(msg, LogLevel.debug, tag: tag, time: time);
}

logError({
  required Object error,
  StackTrace? stackTrace,
  String tag = '',
  DateTime? time,
}) {
  _formatLog('', LogLevel.error, error: error, stackTrace: stackTrace);
}

logTodo(
  String msg, {
  DateTime? time,
  String tag = '',
}) {
  _formatLog(msg, LogLevel.todo, tag: tag, time: time);
}

_formatLog(
  String msg,
  LogLevel level, {
  DateTime? time,
  String tag = '',
  Object? error,
  StackTrace? stackTrace,
}) {
  if (kDebugMode) {
    List<String> txt = [level.asciiColorBegin!];
    txt.add('[$tag]\n');
    if (time != null) {
      txt.add('- ${time.toIso8601String()}');
    }
    txt.add(msg);
    if (stackTrace != null) {
      txt.add('\n\n$stackTrace\n\n');
    }
    if (error != null) {
      txt.add('\n\n$error\n\n');
    }
    txt.add(level.asciiColorEnd!);

    developer.log(txt.join(' '));
  }
}
