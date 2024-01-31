import 'package:logger/logger.dart';

class LogFilters extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return [
      event.message ?? "",
      event.error?.toString() ?? "",
    ];
  }
}
