import 'package:get/get.dart';
import 'package:lines/data/enums/symptom_title.dart';

import '../../core/theme/theme_icon.dart';
import '../enums/symptoms_category_title.dart';
import 'symptom.dart';

class SymptomCategory {
  final String categoryTitle;
  final List<Symptom> symptoms = [];
  final String categoryIconPath;
  final RxBool _rxInHome = false.obs;

  bool get inHome => _rxInHome.value;

  set inHome(bool newValue) {
    _rxInHome.value = newValue;
  }

  SymptomCategory({
    required this.categoryTitle,
    required this.categoryIconPath,
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
    );
    flussoMestrule.addSymptom(
      Symptom(
        symptomName: SymptomTitle.flussoMestrualeLeggero.title,
        iconPath: ThemeIcon.flussoMestrualeLeggero,
      ),
    );
    flussoMestrule.addSymptom(
      Symptom(
        symptomName: SymptomTitle.flussoMestrualeMedio.title,
        iconPath: ThemeIcon.flussoMestrualeMedio,
      ),
    );
    flussoMestrule.addSymptom(
      Symptom(
        symptomName: SymptomTitle.flussoMestrualeAbbondante.title,
        iconPath: ThemeIcon.flussoMestrualeAbbondante,
      ),
    );
    return flussoMestrule;
  }

  static SymptomCategory get sintomiCategory {
    SymptomCategory sintomi = SymptomCategory(
        categoryTitle: SymptomCategoryTitle.sintomi.title,
        categoryIconPath: ThemeIcon.sintomi);
    sintomi.addSymptom(
      Symptom(
          symptomName: SymptomTitle.sintomiCrampi.title,
          iconPath: ThemeIcon.sintomiCrampi),
    );
    sintomi.addSymptom(
      Symptom(
          symptomName: SymptomTitle.sintomiMalDiSchiena.title,
          iconPath: ThemeIcon.sintomiMalDiSchiena),
    );
    sintomi.addSymptom(
      Symptom(
          symptomName: SymptomTitle.sintomiTensioneAlSeno.title,
          iconPath: ThemeIcon.sintomiTensioneAlSeno),
    );
    sintomi.addSymptom(
      Symptom(
          symptomName: SymptomTitle.sintomiGonfiore.title,
          iconPath: ThemeIcon.sintomiGonfiore),
    );
    return sintomi;
  }

  static SymptomCategory get attivitaSessualeCategory {
    SymptomCategory attivitaSessuale = SymptomCategory(
        categoryTitle: SymptomCategoryTitle.attivitaSessuale.title,
        categoryIconPath: ThemeIcon.attivitaSessuale);
    attivitaSessuale.addSymptom(
      Symptom(symptomName: SymptomTitle.attivitaSessualeNessunRapporto.title),
    );
    attivitaSessuale.addSymptom(
      Symptom(symptomName: SymptomTitle.attivitaSessualeRapportoProtetto.title),
    );
    attivitaSessuale.addSymptom(
      Symptom(
          symptomName: SymptomTitle.attivitaSessualeRapportoNonProtetto.title),
    );
    return attivitaSessuale;
  }

  static SymptomCategory get desiderioSessualeCategory {
    SymptomCategory desiderioSessuale = SymptomCategory(
        categoryTitle: SymptomCategoryTitle.desiderioSessuale.title,
        categoryIconPath: ThemeIcon.desiderioSessuale);
    desiderioSessuale.addSymptom(
      Symptom(symptomName: SymptomTitle.desiderioSessualeBasso.title),
    );
    desiderioSessuale.addSymptom(
      Symptom(symptomName: SymptomTitle.desiderioSessualeMedio.title),
    );
    desiderioSessuale.addSymptom(
      Symptom(symptomName: SymptomTitle.desiderioSessualeElevato.title),
    );
    return desiderioSessuale;
  }

  static SymptomCategory get contraccettiviCategory {
    SymptomCategory contraccettivi = SymptomCategory(
        categoryTitle: SymptomCategoryTitle.contraccettivi.title,
        categoryIconPath: ThemeIcon.contraccettivi);
    contraccettivi.addSymptom(
      Symptom(symptomName: SymptomTitle.contraccettiviNessuno.title),
    );
    contraccettivi.addSymptom(
      Symptom(
          symptomName:
              SymptomTitle.contraccettiviPillolaAnticoncezionale.title),
    );
    contraccettivi.addSymptom(
      Symptom(symptomName: SymptomTitle.contraccettiviPreservativo.title),
    );
    contraccettivi.addSymptom(
      Symptom(symptomName: SymptomTitle.contraccettiviAnelloVaginale.title),
    );
    contraccettivi.addSymptom(
      Symptom(
          symptomName:
              SymptomTitle.contraccettiviCerottoAnticoncezionale.title),
    );
    contraccettivi.addSymptom(
      Symptom(symptomName: SymptomTitle.contraccettiviSpirale.title),
    );
    contraccettivi.addSymptom(
      Symptom(symptomName: SymptomTitle.contraccettiviDiaframma.title),
    );
    contraccettivi.addSymptom(
      Symptom(symptomName: SymptomTitle.contraccettiviAltro.title),
    );
    return contraccettivi;
  }

  static SymptomCategory get moodCategory {
    SymptomCategory mood = SymptomCategory(
        categoryTitle: SymptomCategoryTitle.mood.title,
        categoryIconPath: ThemeIcon.mood);
    mood.addSymptom(
      Symptom(
          symptomName: SymptomTitle.moodTranquilla.title,
          iconPath: ThemeIcon.moodTranquilla),
    );
    mood.addSymptom(
      Symptom(
          symptomName: SymptomTitle.moodFelice.title,
          iconPath: ThemeIcon.moodFelice),
    );
    mood.addSymptom(
      Symptom(
          symptomName: SymptomTitle.moodIpersensibile.title,
          iconPath: ThemeIcon.moodIpersensibile),
    );
    mood.addSymptom(
      Symptom(
          symptomName: SymptomTitle.moodTriste.title,
          iconPath: ThemeIcon.moodTriste),
    );
    mood.addSymptom(
      Symptom(
          symptomName: SymptomTitle.moodApatica.title,
          iconPath: ThemeIcon.moodApatica),
    );
    mood.addSymptom(
      Symptom(
          symptomName: SymptomTitle.moodStanca.title,
          iconPath: ThemeIcon.moodStanca),
    );
    mood.addSymptom(
      Symptom(
          symptomName: SymptomTitle.moodArrabbiata.title,
          iconPath: ThemeIcon.moodArrabbiata),
    );
    mood.addSymptom(
      Symptom(
          symptomName: SymptomTitle.moodAutocritica.title,
          iconPath: ThemeIcon.moodAutocritica),
    );
    mood.addSymptom(
      Symptom(
          symptomName: SymptomTitle.moodVivace.title,
          iconPath: ThemeIcon.moodVivace),
    );
    mood.addSymptom(
      Symptom(
          symptomName: SymptomTitle.moodMotivata.title,
          iconPath: ThemeIcon.moodMotivata),
    );
    mood.addSymptom(
      Symptom(
          symptomName: SymptomTitle.moodAnsiosa.title,
          iconPath: ThemeIcon.moodAnsiosa),
    );
    mood.addSymptom(
      Symptom(
          symptomName: SymptomTitle.moodSicura.title,
          iconPath: ThemeIcon.moodSicura),
    );
    mood.addSymptom(
      Symptom(
          symptomName: SymptomTitle.moodIrritabile.title,
          iconPath: ThemeIcon.moodIrritabile),
    );
    mood.addSymptom(
      Symptom(
          symptomName: SymptomTitle.moodEmotiva.title,
          iconPath: ThemeIcon.moodEmotiva),
    );
    mood.addSymptom(
      Symptom(
          symptomName: SymptomTitle.moodSbalziDUmore.title,
          iconPath: ThemeIcon.moodEmotiva),
    );
    return mood;
  }

  static SymptomCategory get livelloDiStressCategory {
    SymptomCategory livelloDiStress = SymptomCategory(
        categoryTitle: SymptomCategoryTitle.livelloDiStress.title,
        categoryIconPath: ThemeIcon.livelloDiStress);
    livelloDiStress.addSymptom(
      Symptom(symptomName: SymptomTitle.livelloDiStressZero.title),
    );
    livelloDiStress.addSymptom(
      Symptom(symptomName: SymptomTitle.livelloDiStressGestibile.title),
    );
    livelloDiStress.addSymptom(
      Symptom(symptomName: SymptomTitle.livelloDiStressIntenso.title),
    );
    return livelloDiStress;
  }

  static SymptomCategory get livelloDiEnergiaCategory {
    SymptomCategory livelloDiEnergia = SymptomCategory(
        categoryTitle: SymptomCategoryTitle.livelloDiEnergia.title,
        categoryIconPath: ThemeIcon.livelloDiEnergia);
    livelloDiEnergia.addSymptom(
      Symptom(symptomName: SymptomTitle.livelloDiEnergiaATerra.title),
    );
    livelloDiEnergia.addSymptom(
      Symptom(symptomName: SymptomTitle.livelloDiEnergiaNormale.title),
    );
    livelloDiEnergia.addSymptom(
      Symptom(symptomName: SymptomTitle.livelloDiEnergiaAMille.title),
    );
    return livelloDiEnergia;
  }

  static SymptomCategory get attivitaFisicaCategory {
    SymptomCategory attivitaFisica = SymptomCategory(
        categoryTitle: SymptomCategoryTitle.attivitaFisica.title,
        categoryIconPath: ThemeIcon.attivitaFisica);
    attivitaFisica.addSymptom(
      Symptom(symptomName: SymptomTitle.attivitaFisicaNessuna.title),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: SymptomTitle.attivitaFisicaYoga.title),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: SymptomTitle.attivitaFisicaAcrobaticaOPilates.title),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: SymptomTitle.attivitaFisicaDanza.title),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: SymptomTitle.attivitaFisicaPalestra.title),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: SymptomTitle.attivitaFisicaSportDiSquadra.title),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: SymptomTitle.attivitaFisicaJogging.title),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: SymptomTitle.attivitaFisicaCrossfit.title),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: SymptomTitle.attivitaFisicaBicicletta.title),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: SymptomTitle.attivitaFisicaTrekking.title),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: SymptomTitle.attivitaFisicaCamminata.title),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: SymptomTitle.attivitaFisicaNuotoOSportDAcqua.title),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: SymptomTitle.attivitaFisicaAltro.title),
    );
    return attivitaFisica;
  }

  static SymptomCategory get pelleCategory {
    SymptomCategory pelle = SymptomCategory(
        categoryTitle: SymptomCategoryTitle.pelle.title,
        categoryIconPath: ThemeIcon.pelle);
    pelle.addSymptom(
      Symptom(symptomName: SymptomTitle.pelleNormale.title),
    );
    pelle.addSymptom(
      Symptom(symptomName: SymptomTitle.pelleSeccaESpenta.title),
    );
    pelle.addSymptom(
      Symptom(symptomName: SymptomTitle.pelleGrassaELucida.title),
    );
    pelle.addSymptom(
      Symptom(symptomName: SymptomTitle.pelleAcneEBrufoli.title),
    );
    pelle.addSymptom(
      Symptom(symptomName: SymptomTitle.pellePruritoEIrritazione.title),
    );
    return pelle;
  }

  static SymptomCategory get capelliCategory {
    SymptomCategory capelli = SymptomCategory(
        categoryTitle: SymptomCategoryTitle.capelli.title,
        categoryIconPath: ThemeIcon.capelli);
    capelli.addSymptom(
      Symptom(symptomName: SymptomTitle.capelliNormali.title),
    );
    capelli.addSymptom(
      Symptom(symptomName: SymptomTitle.capelliCorposiELucenti.title),
    );
    capelli.addSymptom(
      Symptom(symptomName: SymptomTitle.capelliPesantiEGrassi.title),
    );
    capelli.addSymptom(
      Symptom(symptomName: SymptomTitle.capelliSecchiESpenti.title),
    );
    capelli.addSymptom(
      Symptom(symptomName: SymptomTitle.capelliCuteSensibileEIrritata.title),
    );
    capelli.addSymptom(
      Symptom(symptomName: SymptomTitle.capelliPerditaDiCapelli.title),
    );
    return capelli;
  }

  static SymptomCategory get sonnoCategory {
    SymptomCategory sonno = SymptomCategory(
        categoryTitle: SymptomCategoryTitle.sonno.title,
        categoryIconPath: ThemeIcon.sonno);
    sonno.addSymptom(
      Symptom(symptomName: SymptomTitle.sonnoSereno.title),
    );
    sonno.addSymptom(
      Symptom(symptomName: SymptomTitle.sonnoDifficoltaAdAddormentarsi.title),
    );
    sonno.addSymptom(
      Symptom(symptomName: SymptomTitle.sonnoAgitato.title),
    );
    sonno.addSymptom(
      Symptom(symptomName: SymptomTitle.sonnoInsonnia.title),
    );
    return sonno;
  }

  ///return a new list of catergories of symptoms with every selected value set to false
  static List<SymptomCategory> get newList {
    final List<SymptomCategory> newList = [];
    newList.add(SymptomCategory.flussoMestrualeCategory);
    newList.add(SymptomCategory.sintomiCategory);
    newList.add(SymptomCategory.attivitaSessualeCategory);
    newList.add(SymptomCategory.desiderioSessualeCategory);
    newList.add(SymptomCategory.contraccettiviCategory);
    newList.add(SymptomCategory.moodCategory);
    newList.add(SymptomCategory.livelloDiStressCategory);
    newList.add(SymptomCategory.livelloDiEnergiaCategory);
    newList.add(SymptomCategory.attivitaFisicaCategory);
    newList.add(SymptomCategory.pelleCategory);
    newList.add(SymptomCategory.capelliCategory);
    newList.add(SymptomCategory.sonnoCategory);
    return newList;
  }
}
