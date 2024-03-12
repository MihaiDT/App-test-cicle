import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:isar/isar.dart';
import 'package:lines/data/isar/symptom.dart';
import 'package:lines/data/isar/symptom_calendar.dart';
import 'package:lines/data/isar/symptom_category.dart';
import 'package:lines/data/models/user.dart';
import 'package:path_provider/path_provider.dart';

class IsarManager {
  static Isar? db;

  static Future<void> init({User? user}) async {
    // List<int> bytes = utf8.encode("db_${user.userId}_${user.email}");
    // FIXME:
    List<int> bytes =
        utf8.encode("0a457073-32e7-48f7-a20b-eaed04b4f8ac_6000183_85");
    String key = sha256.convert(bytes).toString();

    final dir = await getApplicationDocumentsDirectory();
    db = Isar.openSync(
      [
        SymptomCalendarSchema,
        SymptomCategorySchema,
        SymptomSchema,
      ],
      directory: dir.path,
      name: key,
      inspector: true,
    );

    await seeds();
  }

  static Future<void> seeds() async {
    if (db != null) {
      if (db!.symptomCategorys.countSync() == 0) {
        SymptomCategory.seed();
      }
      if (db!.symptoms.countSync() == 0) {
        Symptom.seed();
      }
    }
  }

  static Future<void> dropDb() async {
    db?.close(deleteFromDisk: true);
  }
}
