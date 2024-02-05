import 'package:get/get.dart';
import 'package:lines/data/enums/symptom_title.dart';

import '../../core/theme/theme_icon.dart';
import '../enums/symptoms_category_title.dart';
import 'symptom.dart';

class SymptomCategory {
  final String categoryTitle;
  final List<Symptom> symptoms = [];
  final String categoryIconPath;

  final int categoryIndex;

  final RxBool _rxInHome = false.obs;

  bool get inHome => _rxInHome.value;

  set inHome(bool newValue) {
    _rxInHome.value = newValue;
  }

  SymptomCategory({
    required this.categoryTitle,
    required this.categoryIconPath,
    required this.categoryIndex,
    bool? inHome,
  }) {
    if (inHome != null) {
      this.inHome = inHome;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SymptomCategory &&
          runtimeType == other.runtimeType &&
          categoryTitle == other.categoryTitle;

  @override
  int get hashCode => categoryTitle.hashCode;

  addSymptom(Symptom newSymptom) {
    symptoms.add(newSymptom);
  }

  @override
  String toString() {
    return 'SymptomCategory{categoryTitle: $categoryTitle, symptoms: $symptoms}';
  }

  static SymptomCategory get flussoMestrualeCategory {
    SymptomCategory flussoMestrule = SymptomCategory(
      categoryTitle: SymptomCategoryTitle.flussoMestruale.title,
      categoryIconPath: ThemeIcon.flussoMestruale,
      categoryIndex: 0,
    );
    flussoMestrule.addSymptom(
      Symptom(
        symptomName: SymptomTitle.flussoMestrualeLeggero.title,
        iconPath: ThemeIcon.flussoMestrualeLeggero,
        category: flussoMestrule,
        indexInSymptomCategory: 0,
      ),
    );
    flussoMestrule.addSymptom(
      Symptom(
        symptomName: SymptomTitle.flussoMestrualeMedio.title,
        iconPath: ThemeIcon.flussoMestrualeMedio,
        category: flussoMestrule,
        indexInSymptomCategory: 1,
      ),
    );
    flussoMestrule.addSymptom(
      Symptom(
        symptomName: SymptomTitle.flussoMestrualeAbbondante.title,
        iconPath: ThemeIcon.flussoMestrualeAbbondante,
        category: flussoMestrule,
        indexInSymptomCategory: 2,
      ),
    );
    return flussoMestrule;
  }

  static SymptomCategory get sintomiCategory {
    SymptomCategory sintomi = SymptomCategory(
      categoryTitle: SymptomCategoryTitle.sintomi.title,
      categoryIconPath: ThemeIcon.sintomi,
      categoryIndex: 1,
    );
    sintomi.addSymptom(
      Symptom(
        symptomName: SymptomTitle.sintomiCrampi.title,
        iconPath: ThemeIcon.sintomiCrampi,
        category: sintomi,
        indexInSymptomCategory: 0,
      ),
    );
    sintomi.addSymptom(
      Symptom(
        symptomName: SymptomTitle.sintomiMalDiSchiena.title,
        iconPath: ThemeIcon.sintomiMalDiSchiena,
        category: sintomi,
        indexInSymptomCategory: 1,
      ),
    );
    sintomi.addSymptom(
      Symptom(
        symptomName: SymptomTitle.sintomiTensioneAlSeno.title,
        iconPath: ThemeIcon.sintomiTensioneAlSeno,
        category: sintomi,
        indexInSymptomCategory: 2,
      ),
    );
    sintomi.addSymptom(
      Symptom(
        symptomName: SymptomTitle.sintomiGonfiore.title,
        iconPath: ThemeIcon.sintomiGonfiore,
        category: sintomi,
        indexInSymptomCategory: 3,
      ),
    );
    return sintomi;
  }

  static SymptomCategory get attivitaSessualeCategory {
    SymptomCategory attivitaSessuale = SymptomCategory(
      categoryTitle: SymptomCategoryTitle.attivitaSessuale.title,
      categoryIconPath: ThemeIcon.attivitaSessuale,
      categoryIndex: 2,
    );
    attivitaSessuale.addSymptom(
      Symptom(
        symptomName: SymptomTitle.attivitaSessualeNessunRapporto.title,
        category: attivitaSessuale,
        indexInSymptomCategory: 0,
      ),
    );
    attivitaSessuale.addSymptom(
      Symptom(
        symptomName: SymptomTitle.attivitaSessualeRapportoProtetto.title,
        category: attivitaSessuale,
        indexInSymptomCategory: 1,
      ),
    );
    attivitaSessuale.addSymptom(
      Symptom(
        symptomName: SymptomTitle.attivitaSessualeRapportoNonProtetto.title,
        category: attivitaSessuale,
        indexInSymptomCategory: 2,
      ),
    );
    return attivitaSessuale;
  }

  static SymptomCategory get desiderioSessualeCategory {
    SymptomCategory desiderioSessuale = SymptomCategory(
      categoryTitle: SymptomCategoryTitle.desiderioSessuale.title,
      categoryIconPath: ThemeIcon.desiderioSessuale,
      categoryIndex: 3,
    );
    desiderioSessuale.addSymptom(
      Symptom(
        symptomName: SymptomTitle.desiderioSessualeBasso.title,
        category: desiderioSessuale,
        indexInSymptomCategory: 0,
      ),
    );
    desiderioSessuale.addSymptom(
      Symptom(
        symptomName: SymptomTitle.desiderioSessualeMedio.title,
        category: desiderioSessuale,
        indexInSymptomCategory: 1,
      ),
    );
    desiderioSessuale.addSymptom(
      Symptom(
        symptomName: SymptomTitle.desiderioSessualeElevato.title,
        category: desiderioSessuale,
        indexInSymptomCategory: 2,
      ),
    );
    return desiderioSessuale;
  }

  static SymptomCategory get contraccettiviCategory {
    SymptomCategory contraccettivi = SymptomCategory(
      categoryTitle: SymptomCategoryTitle.contraccettivi.title,
      categoryIconPath: ThemeIcon.contraccettivi,
      categoryIndex: 4,
    );
    contraccettivi.addSymptom(
      Symptom(
        symptomName: SymptomTitle.contraccettiviNessuno.title,
        category: contraccettivi,
        indexInSymptomCategory: 0,
      ),
    );
    contraccettivi.addSymptom(
      Symptom(
        symptomName: SymptomTitle.contraccettiviPillolaAnticoncezionale.title,
        category: contraccettivi,
        indexInSymptomCategory: 1,
      ),
    );
    contraccettivi.addSymptom(
      Symptom(
        symptomName: SymptomTitle.contraccettiviPreservativo.title,
        category: contraccettivi,
        indexInSymptomCategory: 2,
      ),
    );
    contraccettivi.addSymptom(
      Symptom(
        symptomName: SymptomTitle.contraccettiviAnelloVaginale.title,
        category: contraccettivi,
        indexInSymptomCategory: 3,
      ),
    );
    contraccettivi.addSymptom(
      Symptom(
        symptomName: SymptomTitle.contraccettiviCerottoAnticoncezionale.title,
        category: contraccettivi,
        indexInSymptomCategory: 4,
      ),
    );
    contraccettivi.addSymptom(
      Symptom(
        symptomName: SymptomTitle.contraccettiviSpirale.title,
        category: contraccettivi,
        indexInSymptomCategory: 5,
      ),
    );
    contraccettivi.addSymptom(
      Symptom(
        symptomName: SymptomTitle.contraccettiviDiaframma.title,
        category: contraccettivi,
        indexInSymptomCategory: 6,
      ),
    );
    contraccettivi.addSymptom(
      Symptom(
        symptomName: SymptomTitle.contraccettiviAltro.title,
        category: contraccettivi,
        indexInSymptomCategory: 7,
      ),
    );
    return contraccettivi;
  }

  static SymptomCategory get moodCategory {
    SymptomCategory mood = SymptomCategory(
      categoryTitle: SymptomCategoryTitle.mood.title,
      categoryIconPath: ThemeIcon.mood,
      categoryIndex: 5,
    );
    mood.addSymptom(
      Symptom(
        symptomName: SymptomTitle.moodTranquilla.title,
        iconPath: ThemeIcon.moodTranquilla,
        category: mood,
        indexInSymptomCategory: 0,
      ),
    );
    mood.addSymptom(
      Symptom(
        symptomName: SymptomTitle.moodFelice.title,
        iconPath: ThemeIcon.moodFelice,
        category: mood,
        indexInSymptomCategory: 1,
      ),
    );
    mood.addSymptom(
      Symptom(
        symptomName: SymptomTitle.moodIpersensibile.title,
        iconPath: ThemeIcon.moodIpersensibile,
        category: mood,
        indexInSymptomCategory: 2,
      ),
    );
    mood.addSymptom(
      Symptom(
        symptomName: SymptomTitle.moodTriste.title,
        iconPath: ThemeIcon.moodTriste,
        category: mood,
        indexInSymptomCategory: 3,
      ),
    );
    mood.addSymptom(
      Symptom(
        symptomName: SymptomTitle.moodApatica.title,
        iconPath: ThemeIcon.moodApatica,
        category: mood,
        indexInSymptomCategory: 4,
      ),
    );
    mood.addSymptom(
      Symptom(
        symptomName: SymptomTitle.moodStanca.title,
        iconPath: ThemeIcon.moodStanca,
        category: mood,
        indexInSymptomCategory: 5,
      ),
    );
    mood.addSymptom(
      Symptom(
        symptomName: SymptomTitle.moodArrabbiata.title,
        iconPath: ThemeIcon.moodArrabbiata,
        category: mood,
        indexInSymptomCategory: 6,
      ),
    );
    mood.addSymptom(
      Symptom(
        symptomName: SymptomTitle.moodAutocritica.title,
        iconPath: ThemeIcon.moodAutocritica,
        category: mood,
        indexInSymptomCategory: 7,
      ),
    );
    mood.addSymptom(
      Symptom(
        symptomName: SymptomTitle.moodVivace.title,
        iconPath: ThemeIcon.moodVivace,
        category: mood,
        indexInSymptomCategory: 8,
      ),
    );
    mood.addSymptom(
      Symptom(
        symptomName: SymptomTitle.moodMotivata.title,
        iconPath: ThemeIcon.moodMotivata,
        category: mood,
        indexInSymptomCategory: 9,
      ),
    );
    mood.addSymptom(
      Symptom(
        symptomName: SymptomTitle.moodAnsiosa.title,
        iconPath: ThemeIcon.moodAnsiosa,
        category: mood,
        indexInSymptomCategory: 10,
      ),
    );
    mood.addSymptom(
      Symptom(
        symptomName: SymptomTitle.moodSicura.title,
        iconPath: ThemeIcon.moodSicura,
        category: mood,
        indexInSymptomCategory: 11,
      ),
    );
    mood.addSymptom(
      Symptom(
        symptomName: SymptomTitle.moodIrritabile.title,
        iconPath: ThemeIcon.moodIrritabile,
        category: mood,
        indexInSymptomCategory: 12,
      ),
    );
    mood.addSymptom(
      Symptom(
        symptomName: SymptomTitle.moodEmotiva.title,
        iconPath: ThemeIcon.moodEmotiva,
        category: mood,
        indexInSymptomCategory: 13,
      ),
    );
    mood.addSymptom(
      Symptom(
        symptomName: SymptomTitle.moodSbalziDUmore.title,
        iconPath: ThemeIcon.moodEmotiva,
        category: mood,
        indexInSymptomCategory: 14,
      ),
    );
    return mood;
  }

  static SymptomCategory get livelloDiStressCategory {
    SymptomCategory livelloDiStress = SymptomCategory(
      categoryTitle: SymptomCategoryTitle.livelloDiStress.title,
      categoryIconPath: ThemeIcon.livelloDiStress,
      categoryIndex: 6,
    );
    livelloDiStress.addSymptom(
      Symptom(
        symptomName: SymptomTitle.livelloDiStressZero.title,
        category: livelloDiStress,
        indexInSymptomCategory: 0,
      ),
    );
    livelloDiStress.addSymptom(
      Symptom(
        symptomName: SymptomTitle.livelloDiStressGestibile.title,
        category: livelloDiStress,
        indexInSymptomCategory: 1,
      ),
    );
    livelloDiStress.addSymptom(
      Symptom(
        symptomName: SymptomTitle.livelloDiStressIntenso.title,
        category: livelloDiStress,
        indexInSymptomCategory: 2,
      ),
    );
    return livelloDiStress;
  }

  static SymptomCategory get livelloDiEnergiaCategory {
    SymptomCategory livelloDiEnergia = SymptomCategory(
      categoryTitle: SymptomCategoryTitle.livelloDiEnergia.title,
      categoryIconPath: ThemeIcon.livelloDiEnergia,
      categoryIndex: 7,
    );
    livelloDiEnergia.addSymptom(
      Symptom(
        symptomName: SymptomTitle.livelloDiEnergiaATerra.title,
        category: livelloDiEnergia,
        indexInSymptomCategory: 0,
      ),
    );
    livelloDiEnergia.addSymptom(
      Symptom(
        symptomName: SymptomTitle.livelloDiEnergiaNormale.title,
        category: livelloDiEnergia,
        indexInSymptomCategory: 1,
      ),
    );
    livelloDiEnergia.addSymptom(
      Symptom(
        symptomName: SymptomTitle.livelloDiEnergiaAMille.title,
        category: livelloDiEnergia,
        indexInSymptomCategory: 2,
      ),
    );
    return livelloDiEnergia;
  }

  static SymptomCategory get attivitaFisicaCategory {
    SymptomCategory attivitaFisica = SymptomCategory(
      categoryTitle: SymptomCategoryTitle.attivitaFisica.title,
      categoryIconPath: ThemeIcon.attivitaFisica,
      categoryIndex: 8,
    );
    attivitaFisica.addSymptom(
      Symptom(
        symptomName: SymptomTitle.attivitaFisicaNessuna.title,
        category: attivitaFisica,
        indexInSymptomCategory: 0,
      ),
    );
    attivitaFisica.addSymptom(
      Symptom(
        symptomName: SymptomTitle.attivitaFisicaYoga.title,
        category: attivitaFisica,
        indexInSymptomCategory: 1,
      ),
    );
    attivitaFisica.addSymptom(
      Symptom(
        symptomName: SymptomTitle.attivitaFisicaAcrobaticaOPilates.title,
        category: attivitaFisica,
        indexInSymptomCategory: 2,
      ),
    );
    attivitaFisica.addSymptom(
      Symptom(
        symptomName: SymptomTitle.attivitaFisicaDanza.title,
        category: attivitaFisica,
        indexInSymptomCategory: 3,
      ),
    );
    attivitaFisica.addSymptom(
      Symptom(
        symptomName: SymptomTitle.attivitaFisicaPalestra.title,
        category: attivitaFisica,
        indexInSymptomCategory: 4,
      ),
    );
    attivitaFisica.addSymptom(
      Symptom(
        symptomName: SymptomTitle.attivitaFisicaSportDiSquadra.title,
        category: attivitaFisica,
        indexInSymptomCategory: 5,
      ),
    );
    attivitaFisica.addSymptom(
      Symptom(
        symptomName: SymptomTitle.attivitaFisicaJogging.title,
        category: attivitaFisica,
        indexInSymptomCategory: 6,
      ),
    );
    attivitaFisica.addSymptom(
      Symptom(
        symptomName: SymptomTitle.attivitaFisicaCrossfit.title,
        category: attivitaFisica,
        indexInSymptomCategory: 7,
      ),
    );
    attivitaFisica.addSymptom(
      Symptom(
        symptomName: SymptomTitle.attivitaFisicaBicicletta.title,
        category: attivitaFisica,
        indexInSymptomCategory: 8,
      ),
    );
    attivitaFisica.addSymptom(
      Symptom(
        symptomName: SymptomTitle.attivitaFisicaTrekking.title,
        category: attivitaFisica,
        indexInSymptomCategory: 9,
      ),
    );
    attivitaFisica.addSymptom(
      Symptom(
        symptomName: SymptomTitle.attivitaFisicaCamminata.title,
        category: attivitaFisica,
        indexInSymptomCategory: 10,
      ),
    );
    attivitaFisica.addSymptom(
      Symptom(
        symptomName: SymptomTitle.attivitaFisicaNuotoOSportDAcqua.title,
        category: attivitaFisica,
        indexInSymptomCategory: 11,
      ),
    );
    attivitaFisica.addSymptom(
      Symptom(
        symptomName: SymptomTitle.attivitaFisicaAltro.title,
        category: attivitaFisica,
        indexInSymptomCategory: 12,
      ),
    );
    return attivitaFisica;
  }

  static SymptomCategory get pelleCategory {
    SymptomCategory pelle = SymptomCategory(
      categoryTitle: SymptomCategoryTitle.pelle.title,
      categoryIconPath: ThemeIcon.pelle,
      categoryIndex: 9,
    );
    pelle.addSymptom(
      Symptom(
        symptomName: SymptomTitle.pelleNormale.title,
        category: pelle,
        indexInSymptomCategory: 0,
      ),
    );
    pelle.addSymptom(
      Symptom(
        symptomName: SymptomTitle.pelleSeccaESpenta.title,
        category: pelle,
        indexInSymptomCategory: 1,
      ),
    );
    pelle.addSymptom(
      Symptom(
        symptomName: SymptomTitle.pelleGrassaELucida.title,
        category: pelle,
        indexInSymptomCategory: 2,
      ),
    );
    pelle.addSymptom(
      Symptom(
        symptomName: SymptomTitle.pelleAcneEBrufoli.title,
        category: pelle,
        indexInSymptomCategory: 3,
      ),
    );
    pelle.addSymptom(
      Symptom(
        symptomName: SymptomTitle.pellePruritoEIrritazione.title,
        category: pelle,
        indexInSymptomCategory: 4,
      ),
    );
    return pelle;
  }

  static SymptomCategory get capelliCategory {
    SymptomCategory capelli = SymptomCategory(
      categoryTitle: SymptomCategoryTitle.capelli.title,
      categoryIconPath: ThemeIcon.capelli,
      categoryIndex: 10,
    );
    capelli.addSymptom(
      Symptom(
        symptomName: SymptomTitle.capelliNormali.title,
        category: capelli,
        indexInSymptomCategory: 0,
      ),
    );
    capelli.addSymptom(
      Symptom(
        symptomName: SymptomTitle.capelliCorposiELucenti.title,
        category: capelli,
        indexInSymptomCategory: 1,
      ),
    );
    capelli.addSymptom(
      Symptom(
        symptomName: SymptomTitle.capelliPesantiEGrassi.title,
        category: capelli,
        indexInSymptomCategory: 2,
      ),
    );
    capelli.addSymptom(
      Symptom(
        symptomName: SymptomTitle.capelliSecchiESpenti.title,
        category: capelli,
        indexInSymptomCategory: 3,
      ),
    );
    capelli.addSymptom(
      Symptom(
        symptomName: SymptomTitle.capelliCuteSensibileEIrritata.title,
        category: capelli,
        indexInSymptomCategory: 4,
      ),
    );
    capelli.addSymptom(
      Symptom(
        symptomName: SymptomTitle.capelliPerditaDiCapelli.title,
        category: capelli,
        indexInSymptomCategory: 5,
      ),
    );
    return capelli;
  }

  static SymptomCategory get sonnoCategory {
    SymptomCategory sonno = SymptomCategory(
      categoryTitle: SymptomCategoryTitle.sonno.title,
      categoryIconPath: ThemeIcon.sonno,
      categoryIndex: 11,
    );
    sonno.addSymptom(
      Symptom(
        symptomName: SymptomTitle.sonnoSereno.title,
        category: sonno,
        indexInSymptomCategory: 0,
      ),
    );
    sonno.addSymptom(
      Symptom(
        symptomName: SymptomTitle.sonnoDifficoltaAdAddormentarsi.title,
        category: sonno,
        indexInSymptomCategory: 1,
      ),
    );
    sonno.addSymptom(
      Symptom(
        symptomName: SymptomTitle.sonnoAgitato.title,
        category: sonno,
        indexInSymptomCategory: 2,
      ),
    );
    sonno.addSymptom(
      Symptom(
        symptomName: SymptomTitle.sonnoInsonnia.title,
        category: sonno,
        indexInSymptomCategory: 3,
      ),
    );
    return sonno;
  }

  ///return a new list of catergories of symptoms with every selected value set to false
  static List<SymptomCategory> get newList {
    final List<SymptomCategory> newList = [];
    newList.add(
      SymptomCategory.flussoMestrualeCategory,
    );
    newList.add(
      SymptomCategory.sintomiCategory,
    );
    newList.add(
      SymptomCategory.attivitaSessualeCategory,
    );
    newList.add(
      SymptomCategory.desiderioSessualeCategory,
    );
    newList.add(
      SymptomCategory.contraccettiviCategory,
    );
    newList.add(
      SymptomCategory.moodCategory,
    );
    newList.add(
      SymptomCategory.livelloDiStressCategory,
    );
    newList.add(
      SymptomCategory.livelloDiEnergiaCategory,
    );
    newList.add(
      SymptomCategory.attivitaFisicaCategory,
    );
    newList.add(
      SymptomCategory.pelleCategory,
    );
    newList.add(
      SymptomCategory.capelliCategory,
    );
    newList.add(
      SymptomCategory.sonnoCategory,
    );
    return newList;
  }
}
