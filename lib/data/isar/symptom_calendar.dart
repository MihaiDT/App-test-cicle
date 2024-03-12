import 'package:isar/isar.dart';
import 'package:lines/core/helpers/isar_manager.dart';
import 'package:lines/data/isar/symptom.dart';
import 'package:lines/data/isar/symptom_category.dart';

part 'symptom_calendar.g.dart';

@collection
class SymptomCalendar {
  Id id = Isar.autoIncrement;

  @Index()
  late String date;

  // @Index()
  // final List<int> symptoms = [];
  final symptoms = IsarLinks<Symptom>();

  @override
  String toString() {
    return "{ id: $id, date: $date, symptoms: ${symptoms.toList()}";
  }

  static Map<String, SymptomCalendar> findAll() {
    final result = IsarManager.db?.symptomCalendars.buildQuery(
          sortBy: [
            const SortProperty(
              property: 'date',
              sort: Sort.asc,
            ),
          ],
        ).findAllSync() ??
        [];

    // FIXME: improve me please!!!
    final Map<String, SymptomCalendar> mapResult =
        Map<String, SymptomCalendar>.from({});
    for (final symptomCelndar in List<SymptomCalendar>.from(result)) {
      mapResult[symptomCelndar.date] = symptomCelndar;
    }

    return mapResult;
  }

  static bool dateHasSexualActivity(String date) {
    return (IsarManager.db?.symptomCalendars
                .filter()
                .dateEqualTo(date)
                .symptoms(
                  // Join Symptom
                  (qSymptom) {
                    return qSymptom.category(
                      // Join SymptomCategory
                      (qCategory) =>
                          qCategory.idEqualTo(SymptomCategory.sexualActivityId),
                    );
                  },
                )
                .dateProperty()
                .countSync() ??
            0) >
        0;
  }

  static bool dateHasSymptom(String date) {
    return (IsarManager.db?.symptomCalendars
                .filter()
                .dateEqualTo(date)
                .countSync() ??
            0) >
        0;
  }

  // static Set<String> findDatesWithSex() {
  //   return IsarManager.db?.symptomCalendars
  //           .filter()
  //           .symptoms(
  //             // Join Symptom
  //             (qSymptom) {
  //               return qSymptom.category(
  //                 // Join SymptomCategory
  //                 (qCategory) => qCategory.idEqualTo(SymptomCategory.sexualActivityId),
  //               );
  //             },
  //           )
  //           .dateProperty()
  //           .findAllSync()
  //           .toSet() ??
  //       {};
  // }

  // static Set<String> findDatesWithSymptoms() {
  //   return IsarManager.db?.symptomCalendars.filter().idGreaterThan(0).dateProperty().findAllSync().toSet() ?? {};
  // }

  static SymptomCalendar? findByDate(String date) {
    return IsarManager.db?.symptomCalendars
        .filter()
        .dateEqualTo(
          date,
        )
        .findFirstSync();
  }

  static SymptomCalendar findOrCreateByDate(String date) {
    SymptomCalendar? symptomCalendar = findByDate(date);

    if (symptomCalendar == null) {
      symptomCalendar = SymptomCalendar()..date = date;

      IsarManager.db?.writeTxnSync(() {
        IsarManager.db?.symptomCalendars.putSync(symptomCalendar!);
      });
    }

    return findByDate(date)!;
  }

  static List<SymptomCalendar> findSymptomCalendarsStats({
    int? categoryId,
    int? symptomId,
    required String fromDate,
    required String toDate,
  }) {
    final result = IsarManager.db?.symptomCalendars
        .filter()
        .dateBetween(fromDate, toDate)
        .symptoms(
            // Join Symptom
            (qSymptom) {
          if (symptomId != null) {
            return qSymptom.idEqualTo(symptomId);
          } else {
            return qSymptom.category(
              // Join SymptomCategory
              (qCategory) => qCategory.anyOf(
                [categoryId!],
                (q, int categoryId) => q.idEqualTo(categoryId),
              ),
            );
          }
        })
        .sortByDate() // Sort by date :asc
        .distinctByDate() // Distinct date
        .findAllSync();

    return result ?? [];
  }

  static List<int> findSymptomIdsByDate(String date) {
    final SymptomCalendar? symptomCalendar = findByDate(date);

    return symptomCalendar?.symptoms.filter().idProperty().findAllSync() ?? [];
  }

  static List<Symptom> findSymptomsByDate(String date) {
    final SymptomCalendar? symptomCalendar = findByDate(date);

    return symptomCalendar?.symptoms.filter().findAllSync() ?? [];
  }

  static SymptomCalendar? save({
    required String date,
    required List<Symptom> symptoms,
  }) {
    if (symptoms.isEmpty) {
      final symptomCalendar = findByDate(date);
      if (symptomCalendar != null) {
        delete(symptomCalendar.id);
      }
    } else {
      SymptomCalendar? symptomCalendar = findByDate(date);
      if (symptomCalendar != null) {
        delete(symptomCalendar.id);
      }

      symptomCalendar = findOrCreateByDate(date);
      symptomCalendar.symptoms.addAll(symptoms);

      IsarManager.db?.writeTxnSync(() {
        IsarManager.db?.symptomCalendars.putSync(symptomCalendar!);
      });

      return findByDate(date);
    }

    return null;
  }

  static void delete(int id) {
    IsarManager.db?.writeTxnSync(() {
      IsarManager.db?.symptomCalendars.deleteSync(id);
    });
  }

  bool get hasSymptoms => symptoms.toList().isNotEmpty;
  bool get hasSexualActivity => symptoms
      .toList()
      .where(
        (item) => item.category.value?.id == SymptomCategory.sexualActivityId,
      )
      .toList()
      .isNotEmpty;
}

/*


  static void delete(int id) {
    IsarManager.db?.writeTxnSync(() {
      IsarManager.db?.symptomCalendars.deleteSync(id);
    });
  }

  static Map<String, SymptomCalendar>? save({
    required String date,
    required List<Symptom> symptoms,
  }) {
    if (symptoms.isEmpty) {
      // DELETE
      
    }
    else {
    SymptomCalendar? symptomCalendar = findByDate(date);

    if (symptomCalendar == null) {
      symptomCalendar = SymptomCalendar()..date = date;
      
        symptomCalendar.symptoms.clear();
        symptomCalendar.symptoms.addAll(symptoms);
      

      IsarManager.db?.writeTxnSync(() {
        IsarManager.db?.symptomCalendars.putSync(symptomCalendar!);
      });
    }
  

    return findByDate(date);
*/
