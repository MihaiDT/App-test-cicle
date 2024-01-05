import 'package:hive/hive.dart';

class HiveManager {
  HiveManager._();

  static final HiveManager _instance = HiveManager._();

  factory HiveManager() {
    return _instance;
  }

  static bool get appHidden {
    return Hive.box("linesApp").get(HiveReferenceKeys.firstAccess.name) ??
        false;
  }

  static set appHidden(bool symbol) {
    Hive.box("linesApp").put(HiveReferenceKeys.firstAccess.name, symbol);
  }
}

enum HiveReferenceKeys {
  firstAccess;
}
