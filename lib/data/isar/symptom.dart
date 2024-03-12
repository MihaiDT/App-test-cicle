import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:lines/core/helpers/isar_manager.dart';
import 'package:lines/core/theme/theme_icon.dart';
import 'package:lines/data/enums/symptom_title.dart';
import 'package:lines/data/isar/symptom_category.dart';

part 'symptom.g.dart';

@collection
class Symptom {
  Id id = Isar.autoIncrement;
  late String name;
  late String iconPath;

  @ignore
  RxBool rxSelected = false.obs;

  bool get selected => rxSelected.value;

  set selected(bool newValue) => rxSelected.value = newValue;

  @Index()
  late int position = 0;

  final category = IsarLink<SymptomCategory>();

  @override
  String toString() {
    return "{ id: $id, name: $name, position: $position, category: ${category.value} }";
  }

  bool get isAttivitaSessuale =>
      (category.value as SymptomCategory).id ==
      SymptomCategory.sexualActivityId;

  static List<Symptom> findByCategoryId({required int categoryId}) {
    final List<Symptom>? result = IsarManager.db?.symptoms
        .filter()
        .category(
          (q) => q.idEqualTo(categoryId),
        )
        .findAllSync();

    return result ?? [];
  }

  static void seed() {
    IsarManager.db?.writeTxnSync(() {
      _flussoMestrualeSeed();
      _sintomiSeed();
      _attivitaSessualeSeed();
      _desiderioSessualeSeed();
      _contraccettiviSeed();
      _moodSeed();
      _stressSeed();
      _energiaSeed();
      _attivitaFisicaSeed();
      _pelleSeed();
      _capelliSeed();
      _sonnoSeed();
    });
  }

  static void _flussoMestrualeSeed() {
    late Symptom symptom;

    SymptomCategory? category = IsarManager.db!.symptomCategorys
        .filter()
        .idEqualTo(1)
        .findAllSync()
        .firstOrNull;

    if (category != null) {
      symptom = Symptom()
        ..name = SymptomTitle.flussoMestrualeLeggero.title
        ..iconPath = ThemeIcon.flussoMestrualeLeggero
        ..position = 1
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.flussoMestrualeMedio.title
        ..iconPath = ThemeIcon.flussoMestrualeMedio
        ..position = 2
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.flussoMestrualeAbbondante.title
        ..iconPath = ThemeIcon.flussoMestrualeAbbondante
        ..position = 3
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);
    }
  }

  static void _sintomiSeed() {
    late Symptom symptom;

    SymptomCategory? category = IsarManager.db!.symptomCategorys
        .filter()
        .idEqualTo(2)
        .findAllSync()
        .firstOrNull;

    if (category != null) {
      symptom = Symptom()
        ..name = SymptomTitle.sintomiCrampi.title
        ..iconPath = ThemeIcon.sintomiCrampi
        ..position = 1
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.sintomiMalDiSchiena.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 2
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.sintomiTensioneAlSeno.title
        ..iconPath = ThemeIcon.sintomiTensioneAlSeno
        ..position = 3
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.sintomiGonfiore.title
        ..iconPath = ThemeIcon.sintomiGonfiore
        ..position = 4
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);
    }
  }

  static void _attivitaSessualeSeed() {
    late Symptom symptom;

    SymptomCategory? category = IsarManager.db!.symptomCategorys
        .filter()
        .idEqualTo(3)
        .findAllSync()
        .firstOrNull;

    if (category != null) {
      symptom = Symptom()
        ..name = SymptomTitle.attivitaSessualeNessunRapporto.title
        ..iconPath = ThemeIcon.sintomiCrampi
        ..position = 1
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.attivitaSessualeRapportoProtetto.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 2
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.attivitaSessualeRapportoNonProtetto.title
        ..iconPath = ThemeIcon.sintomiTensioneAlSeno
        ..position = 3
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);
    }
  }

  static void _desiderioSessualeSeed() {
    late Symptom symptom;

    SymptomCategory? category = IsarManager.db!.symptomCategorys
        .filter()
        .idEqualTo(4)
        .findAllSync()
        .firstOrNull;

    if (category != null) {
      symptom = Symptom()
        ..name = SymptomTitle.desiderioSessualeBasso.title
        ..iconPath = ThemeIcon.sintomiCrampi
        ..position = 1
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.desiderioSessualeMedio.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 2
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.desiderioSessualeElevato.title
        ..iconPath = ThemeIcon.sintomiTensioneAlSeno
        ..position = 3
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);
    }
  }

  static void _contraccettiviSeed() {
    late Symptom symptom;

    SymptomCategory? category = IsarManager.db!.symptomCategorys
        .filter()
        .idEqualTo(5)
        .findAllSync()
        .firstOrNull;

    if (category != null) {
      symptom = Symptom()
        ..name = SymptomTitle.contraccettiviNessuno.title
        ..iconPath = ThemeIcon.sintomiCrampi
        ..position = 1
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.contraccettiviPillolaAnticoncezionale.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 2
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.contraccettiviPreservativo.title
        ..iconPath = ThemeIcon.sintomiTensioneAlSeno
        ..position = 3
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.contraccettiviAnelloVaginale.title
        ..iconPath = ThemeIcon.sintomiCrampi
        ..position = 4
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.contraccettiviCerottoAnticoncezionale.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 5
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.contraccettiviSpirale.title
        ..iconPath = ThemeIcon.sintomiTensioneAlSeno
        ..position = 6
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.contraccettiviDiaframma.title
        ..iconPath = ThemeIcon.sintomiCrampi
        ..position = 7
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.contraccettiviAltro.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 8
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);
    }
  }

  static void _moodSeed() {
    late Symptom symptom;

    SymptomCategory? category = IsarManager.db!.symptomCategorys
        .filter()
        .idEqualTo(6)
        .findAllSync()
        .firstOrNull;

    if (category != null) {
      symptom = Symptom()
        ..name = SymptomTitle.moodTranquilla.title
        ..iconPath = ThemeIcon.sintomiCrampi
        ..position = 1
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.moodFelice.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 2
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.moodIpersensibile.title
        ..iconPath = ThemeIcon.sintomiTensioneAlSeno
        ..position = 3
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.moodTriste.title
        ..iconPath = ThemeIcon.sintomiCrampi
        ..position = 4
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.moodApatica.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 5
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.moodStanca.title
        ..iconPath = ThemeIcon.sintomiTensioneAlSeno
        ..position = 6
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.moodArrabbiata.title
        ..iconPath = ThemeIcon.sintomiCrampi
        ..position = 7
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.moodAutocritica.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 8
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.moodVivace.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 9
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.moodMotivata.title
        ..iconPath = ThemeIcon.sintomiTensioneAlSeno
        ..position = 10
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.moodAnsiosa.title
        ..iconPath = ThemeIcon.sintomiCrampi
        ..position = 11
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.moodSicura.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 12
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.moodIrritabile.title
        ..iconPath = ThemeIcon.sintomiTensioneAlSeno
        ..position = 13
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.moodEmotiva.title
        ..iconPath = ThemeIcon.sintomiCrampi
        ..position = 14
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.moodSbalziDUmore.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 15
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);
    }
  }

  static void _stressSeed() {
    late Symptom symptom;

    SymptomCategory? category = IsarManager.db!.symptomCategorys
        .filter()
        .idEqualTo(7)
        .findAllSync()
        .firstOrNull;

    if (category != null) {
      symptom = Symptom()
        ..name = SymptomTitle.livelloDiStressZero.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 1
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.livelloDiStressGestibile.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 2
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.livelloDiStressIntenso.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 3
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);
    }
  }

  static void _energiaSeed() {
    late Symptom symptom;

    SymptomCategory? category = IsarManager.db!.symptomCategorys
        .filter()
        .idEqualTo(8)
        .findAllSync()
        .firstOrNull;

    if (category != null) {
      symptom = Symptom()
        ..name = SymptomTitle.livelloDiEnergiaATerra.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 1
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.livelloDiEnergiaNormale.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 2
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.livelloDiEnergiaAMille.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 3
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);
    }
  }

  static void _attivitaFisicaSeed() {
    late Symptom symptom;

    SymptomCategory? category = IsarManager.db!.symptomCategorys
        .filter()
        .idEqualTo(9)
        .findAllSync()
        .firstOrNull;

    if (category != null) {
      symptom = Symptom()
        ..name = SymptomTitle.attivitaFisicaYoga.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 1
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.attivitaFisicaAcrobaticaOPilates.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 2
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.attivitaFisicaDanza.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 3
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.attivitaFisicaPalestra.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 4
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.attivitaFisicaSportDiSquadra.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 5
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.attivitaFisicaJogging.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 6
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.attivitaFisicaCrossfit.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 7
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.attivitaFisicaBicicletta.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 8
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.attivitaFisicaTrekking.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 9
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.attivitaFisicaCamminata.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 10
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.attivitaFisicaNuotoOSportDAcqua.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 11
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.attivitaFisicaAltro.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 12
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);
    }
  }

  static void _pelleSeed() {
    late Symptom symptom;

    SymptomCategory? category = IsarManager.db!.symptomCategorys
        .filter()
        .idEqualTo(10)
        .findAllSync()
        .firstOrNull;

    if (category != null) {
      symptom = Symptom()
        ..name = SymptomTitle.pelleNormale.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 1
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.pelleSeccaESpenta.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 2
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.pelleGrassaELucida.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 3
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.pelleAcneEBrufoli.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 4
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.pellePruritoEIrritazione.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 5
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);
    }
  }

  static void _capelliSeed() {
    late Symptom symptom;

    SymptomCategory? category = IsarManager.db!.symptomCategorys
        .filter()
        .idEqualTo(11)
        .findAllSync()
        .firstOrNull;

    if (category != null) {
      symptom = Symptom()
        ..name = SymptomTitle.capelliNormali.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 1
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.capelliCorposiELucenti.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 2
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.capelliPesantiEGrassi.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 3
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.capelliSecchiESpenti.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 4
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.capelliCuteSensibileEIrritata.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 5
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);
    }
  }

  static void _sonnoSeed() {
    late Symptom symptom;

    SymptomCategory? category = IsarManager.db!.symptomCategorys
        .filter()
        .idEqualTo(12)
        .findAllSync()
        .firstOrNull;

    if (category != null) {
      symptom = Symptom()
        ..name = SymptomTitle.sonnoSereno.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 1
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.sonnoDifficoltaAdAddormentarsi.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 2
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.sonnoAgitato.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 3
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);

      symptom = Symptom()
        ..name = SymptomTitle.sonnoInsonnia.title
        ..iconPath = ThemeIcon.sintomiMalDiSchiena
        ..position = 4
        ..category.value = category;
      IsarManager.db?.symptoms.putSync(symptom);
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Symptom && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
