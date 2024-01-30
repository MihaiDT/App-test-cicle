import 'package:hive/hive.dart';

class HiveManager {
  HiveManager._();

  static final HiveManager _instance = HiveManager._();

  factory HiveManager() {
    return _instance;
  }

  static bool get appHidden {
    return Hive.box("linesApp").get(HiveReferenceKeys.appHidden.name) ?? false;
  }

  static set appHidden(bool symbol) {
    Hive.box("linesApp").put(HiveReferenceKeys.appHidden.name, symbol);
  }

  static bool get firstAccess {
    return Hive.box("linesApp").get(HiveReferenceKeys.isFirstAccess.name) ??
        false;
  }

  static set firstAccess(bool symbol) {
    Hive.box("linesApp").put(HiveReferenceKeys.isFirstAccess.name, symbol);
  }

  static String get userId {
    return Hive.box("linesApp").get(HiveReferenceKeys.userId.name) ?? "";
  }

  static set userId(String userId) {
    Hive.box("linesApp").put(HiveReferenceKeys.userId.name, userId);
  }
}

enum HiveReferenceKeys {
  appHidden,
  isFirstAccess,
  userId;
}
