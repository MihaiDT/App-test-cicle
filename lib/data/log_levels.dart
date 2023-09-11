enum LogLevel {
  debug,
  error,
  todo,
}

extension $LogLevelString on LogLevel {
  String? get value => {
        LogLevel.debug: 'DEBUG',
        LogLevel.error: 'ERROR',
        LogLevel.todo: 'TODO',
      }[this];

  String? get asciiColorBegin => {
        LogLevel.debug: '\x1B[35m',
        LogLevel.error: '\x1B[31m',
        LogLevel.todo: '\x1B[33m',
      }[this];

  String? get asciiColorEnd => '\x1B[0m';
}
