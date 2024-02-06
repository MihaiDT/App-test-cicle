import 'package:hive/hive.dart';
import 'package:lines/data/models/symptom.dart';

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
        true;
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

  static Map<DateTime, List<Symptom>> get savedSymptoms {
    return Hive.box("linesApp").get(HiveReferenceKeys.savedSymptoms.name) ??
        <DateTime, List<Symptom>>{};
  }

  static set savedSymptoms(Map<DateTime, List<Symptom>> savedSymptoms) {
    Hive.box("linesApp")
        .put(HiveReferenceKeys.savedSymptoms.name, savedSymptoms);
  }

  static int get numberOfAccess {
    return Hive.box("linesApp").get(HiveReferenceKeys.numberOfAccess.name) ?? 1;
  }

  static set numberOfAccess(int numberOfAccess) {
    if (numberOfAccess <= 3) {
      Hive.box("linesApp")
          .put(HiveReferenceKeys.numberOfAccess.name, numberOfAccess);
    }
  }
}

enum HiveReferenceKeys {
  appHidden,
  isFirstAccess,
  userId,
  savedSymptoms,
  numberOfAccess;
}
