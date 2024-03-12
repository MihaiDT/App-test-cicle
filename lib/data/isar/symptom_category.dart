import 'package:isar/isar.dart';
import 'package:lines/core/helpers/isar_manager.dart';
import 'package:lines/core/theme/theme_icon.dart';
import 'package:lines/data/enums/symptoms_category_title.dart';
import 'package:lines/data/isar/symptom.dart';

part 'symptom_category.g.dart';

@collection
class SymptomCategory {
  static const sexualActivityId = 3;

  late Id id;
  late String name;
  late String iconPath;

  @Index()
  late int position = 0;
  late bool inHome;

  @Backlink(to: 'category')
  final symptoms = IsarLinks<Symptom>();

  @override
  String toString() {
    return "{ id: $id, name: $name, iconPath: $iconPath, inHome: $inHome, position: $position }";
  }

  static List<SymptomCategory> findAll() {
    final result = IsarManager.db?.symptomCategorys.buildQuery(
      sortBy: [
        const SortProperty(
          property: 'position',
          sort: Sort.asc,
        ),
      ],
    ).findAllSync();

    return List<SymptomCategory>.from((result ?? []).toList());
  }

  static void seed() {
    IsarManager.db?.writeTxnSync(() {
      // Flusso mestruale
      SymptomCategory category = SymptomCategory()
        ..id = 1
        ..name = SymptomCategoryTitle.flussoMestruale.title
        ..iconPath = ThemeIcon.flussoMestruale
        ..position = 1
        ..inHome = true;
      IsarManager.db?.symptomCategorys.putSync(category);

      // Sintomi
      category = SymptomCategory()
        ..id = 2
        ..name = SymptomCategoryTitle.sintomi.title
        ..iconPath = ThemeIcon.sintomi
        ..position = 2
        ..inHome = false;
      IsarManager.db?.symptomCategorys.putSync(category);

      // Attività sessuale
      category = SymptomCategory()
        ..id = 3
        ..name = SymptomCategoryTitle.attivitaSessuale.title
        ..iconPath = ThemeIcon.attivitaSessuale
        ..position = 3
        ..inHome = false;
      IsarManager.db?.symptomCategorys.putSync(category);

      // Desiderio sessuale
      category = SymptomCategory()
        ..id = 4
        ..name = SymptomCategoryTitle.desiderioSessuale.title
        ..iconPath = ThemeIcon.desiderioSessuale
        ..position = 4
        ..inHome = false;
      IsarManager.db?.symptomCategorys.putSync(category);

      // Contraccettivi
      category = SymptomCategory()
        ..id = 5
        ..name = SymptomCategoryTitle.contraccettivi.title
        ..iconPath = ThemeIcon.contraccettivi
        ..position = 5
        ..inHome = false;
      IsarManager.db?.symptomCategorys.putSync(category);

      // Mood
      category = SymptomCategory()
        ..id = 6
        ..name = SymptomCategoryTitle.mood.title
        ..iconPath = ThemeIcon.mood
        ..position = 6
        ..inHome = false;
      IsarManager.db?.symptomCategorys.putSync(category);

      // Livello di stress
      category = SymptomCategory()
        ..id = 7
        ..name = SymptomCategoryTitle.livelloDiStress.title
        ..iconPath = ThemeIcon.livelloDiStress
        ..position = 7
        ..inHome = false;
      IsarManager.db?.symptomCategorys.putSync(category);

      // Livello di energia
      category = SymptomCategory()
        ..id = 8
        ..name = SymptomCategoryTitle.livelloDiEnergia.title
        ..iconPath = ThemeIcon.livelloDiEnergia
        ..position = 8
        ..inHome = false;
      IsarManager.db?.symptomCategorys.putSync(category);

      // Attività fisica
      category = SymptomCategory()
        ..id = 9
        ..name = SymptomCategoryTitle.attivitaFisica.title
        ..iconPath = ThemeIcon.attivitaFisica
        ..position = 9
        ..inHome = false;
      IsarManager.db?.symptomCategorys.putSync(category);

      // Pelle
      category = SymptomCategory()
        ..id = 10
        ..name = SymptomCategoryTitle.pelle.title
        ..iconPath = ThemeIcon.pelle
        ..position = 10
        ..inHome = false;
      IsarManager.db?.symptomCategorys.putSync(category);

      // Capelli
      category = SymptomCategory()
        ..id = 11
        ..name = SymptomCategoryTitle.capelli.title
        ..iconPath = ThemeIcon.capelli
        ..position = 11
        ..inHome = false;
      IsarManager.db?.symptomCategorys.putSync(category);

      // Sonno
      category = SymptomCategory()
        ..id = 12
        ..name = SymptomCategoryTitle.sonno.title
        ..iconPath = ThemeIcon.sonno
        ..position = 12
        ..inHome = false;
      IsarManager.db?.symptomCategorys.putSync(category);
    });
  }
}
