import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/date_time_extension.dart';

import '../core/theme/theme_icon.dart';
import '../data/models/symptom.dart';
import '../data/models/symptom_category.dart';

class SymptomsController extends GetxController {
  Stream<DateTime>? streamSub;
  late StreamSubscription<DateTime> _subscription;
  DateTime value;
  final VoidCallback? onSymptomChanged;
  final RxList<Symptom> rxSavedSymptoms = <Symptom>[].obs;

  final RxList<SymptomCategory> rxCurrentCategories = <SymptomCategory>[].obs;

  List<SymptomCategory> get currentCategories => rxCurrentCategories;

  set currentCategories(List<SymptomCategory> newCategories) {
    //being a RxList type we need to change the value inside the actual list and not change its reference with a new one, in order to update correctly its state
    rxCurrentCategories.clear();
    rxCurrentCategories.addAll(newCategories);
  }

  void saveSymptoms() {
    rxSavedSymptoms.clear();
    rxSavedSymptoms.addAll(getActiveSymptoms);
  }

  List<Symptom> get getActiveSymptoms {
    List<Symptom> list = currentCategories
        .expand((element) =>
            element.symptoms.where((element) => element.selected == true))
        .toList();
    return list;
  }

  SymptomsController({
    required this.value,
    this.onSymptomChanged,
  }) {
    currentCategories = _getSymptomCategoriesForDay(value);
    saveSymptoms();
  }

  ///use this constructor if the date is supposed to change
  SymptomsController.withStreamData({
    required this.value,
    required this.streamSub,
    this.onSymptomChanged,
  }) {
    currentCategories = _getSymptomCategoriesForDay(value);
    if (streamSub != null) {
      _subscription = streamSub!.listen((date) {
        if (!value.isSameDay(date)) {
          value = date;
          currentCategories = _getSymptomCategoriesForDay(date);
        }
      });
    }

    saveSymptoms();
  }

  void reset() {
    currentCategories = _getSymptomCategoriesForDay(value);
  }

  ///return a new list of catergories of symptoms with every selected value set to false
  List<SymptomCategory> get _getNewList {
    final List<SymptomCategory> newList = [];
    newList.add(_getFlussoMestrualeCategory());
    newList.add(_getSintomiCategory());
    newList.add(_getAttivitaSessualeCategory());
    newList.add(_getDesiderioSessuale());
    newList.add(_getContraccettivi());
    newList.add(_getMood());
    newList.add(_getLivelloDiStress());
    newList.add(_getLivelloDiEnergia());
    newList.add(_getAttivitaFisica());
    newList.add(_getPelle());
    newList.add(_getCapelli());
    newList.add(_getSonno());
    return newList;
  }

  ///remove subscription when this controller it's not used anymore
  void dispose() {
    _subscription.cancel();
  }

  ///change selected value for the symptom of a particular category
  void changeSelectedValue(int categoryIndex, int symptomIndex) {
    if (categoryIndex == 0) {
      for (Symptom symptom in currentCategories[categoryIndex].symptoms) {
        symptom.selected = false;
      }
    }
    currentCategories[categoryIndex].symptoms[symptomIndex].selected =
        !currentCategories[categoryIndex].symptoms[symptomIndex].selected;

    if (onSymptomChanged != null) {
      onSymptomChanged!();
    }
    //TODO: save new value in db
  }

  //return a list of categories for the day where the selected value of each symptom can be either true or false
  List<SymptomCategory> _getSymptomCategoriesForDay(DateTime day) {
    //TODO: read from localdb the saved symptoms
    //test values , do not use in later implementation
    Map<int, List<int>> x = {
      0: [2],
      1: [0, 3]
    };
    List<SymptomCategory> newList = _getNewList;

    for (int key in x.keys) {
      for (int symptom in x[key]!) {
        newList[key].symptoms[symptom].selected = true;
      }
    }

    return newList;
  }

  SymptomCategory _getFlussoMestrualeCategory() {
    SymptomCategory flussoMestrule = SymptomCategory(
      categoryTitle: 'Flusso mestruale',
      categoryIconPath: ThemeIcon.flussoMestruale,
    );
    flussoMestrule.addSymptom(
      Symptom(
        symptomName: 'Leggero',
        iconPath: ThemeIcon.flussoMestrualeLeggero,
      ),
    );
    flussoMestrule.addSymptom(
      Symptom(
        symptomName: 'Medio',
        iconPath: ThemeIcon.flussoMestrualeMedio,
      ),
    );
    flussoMestrule.addSymptom(
      Symptom(
        symptomName: 'Abbondante',
        iconPath: ThemeIcon.flussoMestrualeAbbondante,
      ),
    );
    return flussoMestrule;
  }

  SymptomCategory _getSintomiCategory() {
    SymptomCategory sintomi = SymptomCategory(
        categoryTitle: 'Sintomi', categoryIconPath: ThemeIcon.sintomi);
    sintomi.addSymptom(
      Symptom(symptomName: 'Crampi', iconPath: ThemeIcon.sintomiCrampi),
    );
    sintomi.addSymptom(
      Symptom(
          symptomName: 'Mal di schiena',
          iconPath: ThemeIcon.sintomiMalDiSchiena),
    );
    sintomi.addSymptom(
      Symptom(
          symptomName: 'Tensione al seno',
          iconPath: ThemeIcon.sintomiTensioneAlSeno),
    );
    sintomi.addSymptom(
      Symptom(symptomName: 'Gonfiore', iconPath: ThemeIcon.sintomiGonfiore),
    );
    return sintomi;
  }

  SymptomCategory _getAttivitaSessualeCategory() {
    SymptomCategory attivitaSessuale = SymptomCategory(
        categoryTitle: 'Attività sessuale',
        categoryIconPath: ThemeIcon.attivitaSessuale);
    attivitaSessuale.addSymptom(
      Symptom(symptomName: 'Nessun rapporto'),
    );
    attivitaSessuale.addSymptom(
      Symptom(symptomName: 'Rapporto protetto'),
    );
    attivitaSessuale.addSymptom(
      Symptom(symptomName: 'Rapporto non protetto'),
    );
    return attivitaSessuale;
  }

  SymptomCategory _getDesiderioSessuale() {
    SymptomCategory desiderioSessuale = SymptomCategory(
        categoryTitle: 'Desiderio sessuale',
        categoryIconPath: ThemeIcon.desiderioSessuale);
    desiderioSessuale.addSymptom(
      Symptom(symptomName: 'Basso'),
    );
    desiderioSessuale.addSymptom(
      Symptom(symptomName: 'Medio'),
    );
    desiderioSessuale.addSymptom(
      Symptom(symptomName: 'Elevato'),
    );
    return desiderioSessuale;
  }

  SymptomCategory _getContraccettivi() {
    SymptomCategory contraccettivi = SymptomCategory(
        categoryTitle: 'Contraccettivi',
        categoryIconPath: ThemeIcon.contraccettivi);
    contraccettivi.addSymptom(
      Symptom(symptomName: 'Nessuno'),
    );
    contraccettivi.addSymptom(
      Symptom(symptomName: 'Pillola anticoncezionale'),
    );
    contraccettivi.addSymptom(
      Symptom(symptomName: 'Preservativo'),
    );
    contraccettivi.addSymptom(
      Symptom(symptomName: 'Anello vaginale'),
    );
    contraccettivi.addSymptom(
      Symptom(symptomName: 'Cerotto anticoncezionale'),
    );
    contraccettivi.addSymptom(
      Symptom(symptomName: 'Spirale'),
    );
    contraccettivi.addSymptom(
      Symptom(symptomName: 'Diaframma'),
    );
    contraccettivi.addSymptom(
      Symptom(symptomName: 'Altro'),
    );
    return contraccettivi;
  }

  SymptomCategory _getMood() {
    SymptomCategory mood = SymptomCategory(
        categoryTitle: 'Mood', categoryIconPath: ThemeIcon.mood);
    mood.addSymptom(
      Symptom(symptomName: 'Tranquilla', iconPath: ThemeIcon.moodTranquilla),
    );
    mood.addSymptom(
      Symptom(symptomName: 'Felice', iconPath: ThemeIcon.moodFelice),
    );
    mood.addSymptom(
      Symptom(
          symptomName: 'Ipersensibile', iconPath: ThemeIcon.moodIpersensibile),
    );
    mood.addSymptom(
      Symptom(symptomName: 'Triste', iconPath: ThemeIcon.moodTriste),
    );
    mood.addSymptom(
      Symptom(symptomName: 'Apatica', iconPath: ThemeIcon.moodApatica),
    );
    mood.addSymptom(
      Symptom(symptomName: 'Stanca', iconPath: ThemeIcon.moodStanca),
    );
    mood.addSymptom(
      Symptom(symptomName: 'Arrabbiata', iconPath: ThemeIcon.moodArrabbiata),
    );
    mood.addSymptom(
      Symptom(symptomName: 'Autocritica', iconPath: ThemeIcon.moodAutocritica),
    );
    mood.addSymptom(
      Symptom(symptomName: 'Vivace', iconPath: ThemeIcon.moodVivace),
    );
    mood.addSymptom(
      Symptom(symptomName: 'Motivata', iconPath: ThemeIcon.moodMotivata),
    );
    mood.addSymptom(
      Symptom(symptomName: 'Ansiosa', iconPath: ThemeIcon.moodAnsiosa),
    );
    mood.addSymptom(
      Symptom(symptomName: 'Sicura', iconPath: ThemeIcon.moodSicura),
    );
    mood.addSymptom(
      Symptom(symptomName: 'Irritabile', iconPath: ThemeIcon.moodIrritabile),
    );
    mood.addSymptom(
      Symptom(symptomName: 'Emotiva', iconPath: ThemeIcon.moodEmotiva),
    );
    mood.addSymptom(
      Symptom(symptomName: 'Sbalzi d\'umore', iconPath: ThemeIcon.moodEmotiva),
    );
    return mood;
  }

  SymptomCategory _getLivelloDiStress() {
    SymptomCategory livelloDiStress = SymptomCategory(
        categoryTitle: 'Livello di stress',
        categoryIconPath: ThemeIcon.livelloDiStress);
    livelloDiStress.addSymptom(
      Symptom(symptomName: 'Zero'),
    );
    livelloDiStress.addSymptom(
      Symptom(symptomName: 'Gestibile'),
    );
    livelloDiStress.addSymptom(
      Symptom(symptomName: 'Intenso'),
    );
    return livelloDiStress;
  }

  SymptomCategory _getLivelloDiEnergia() {
    SymptomCategory livelloDiEnergia = SymptomCategory(
        categoryTitle: 'Livello di energia',
        categoryIconPath: ThemeIcon.livelloDiEnergia);
    livelloDiEnergia.addSymptom(
      Symptom(symptomName: 'A terra'),
    );
    livelloDiEnergia.addSymptom(
      Symptom(symptomName: 'Normale'),
    );
    livelloDiEnergia.addSymptom(
      Symptom(symptomName: 'A mille'),
    );
    return livelloDiEnergia;
  }

  SymptomCategory _getAttivitaFisica() {
    SymptomCategory attivitaFisica = SymptomCategory(
        categoryTitle: 'Attività fisica',
        categoryIconPath: ThemeIcon.attivitaFisica);
    attivitaFisica.addSymptom(
      Symptom(symptomName: 'Nessuna'),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: 'Yoga'),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: 'Acrobatica o pilates'),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: 'Danza'),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: 'Palestra'),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: 'Sport di squadra'),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: 'Jogging'),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: 'Crossifit'),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: 'Bicicletta'),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: 'Trekking'),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: 'Camminata'),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: 'Nuoto o sport d\'acqua'),
    );
    attivitaFisica.addSymptom(
      Symptom(symptomName: 'Altro'),
    );
    return attivitaFisica;
  }

  SymptomCategory _getPelle() {
    SymptomCategory pelle = SymptomCategory(
        categoryTitle: 'Pelle', categoryIconPath: ThemeIcon.pelle);
    pelle.addSymptom(
      Symptom(symptomName: 'Normale'),
    );
    pelle.addSymptom(
      Symptom(symptomName: 'Secca e spenta'),
    );
    pelle.addSymptom(
      Symptom(symptomName: 'Grassa e lucida'),
    );
    pelle.addSymptom(
      Symptom(symptomName: 'Acne e brufoli'),
    );
    pelle.addSymptom(
      Symptom(symptomName: 'Prurito e irritazione'),
    );
    return pelle;
  }

  SymptomCategory _getCapelli() {
    SymptomCategory capelli = SymptomCategory(
        categoryTitle: 'Capelli', categoryIconPath: ThemeIcon.capelli);
    capelli.addSymptom(
      Symptom(symptomName: 'Normali'),
    );
    capelli.addSymptom(
      Symptom(symptomName: 'Corposi e lucenti'),
    );
    capelli.addSymptom(
      Symptom(symptomName: 'Pesanti e grassi'),
    );
    capelli.addSymptom(
      Symptom(symptomName: 'Secchi e spenti'),
    );
    capelli.addSymptom(
      Symptom(symptomName: 'Cute sensibile e irritata'),
    );
    capelli.addSymptom(
      Symptom(symptomName: 'Perdita di capelli'),
    );
    return capelli;
  }

  SymptomCategory _getSonno() {
    SymptomCategory sonno = SymptomCategory(
        categoryTitle: 'Sonno', categoryIconPath: ThemeIcon.sonno);
    sonno.addSymptom(
      Symptom(symptomName: 'Sonno sereno'),
    );
    sonno.addSymptom(
      Symptom(symptomName: 'Difficoltà ad addormentarsi'),
    );
    sonno.addSymptom(
      Symptom(symptomName: 'Sonno agitato'),
    );
    sonno.addSymptom(
      Symptom(symptomName: 'Insonnia'),
    );
    return sonno;
  }
}
