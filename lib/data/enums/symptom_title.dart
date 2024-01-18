enum SymptomTitle {
  // Flusso Mestruale
  flussoMestrualeLeggero,
  flussoMestrualeMedio,
  flussoMestrualeAbbondante,

  // Sintomi
  sintomiCrampi,
  sintomiMalDiSchiena,
  sintomiTensioneAlSeno,
  sintomiGonfiore,

  // Attività Sessuale
  attivitaSessualeNessunRapporto,
  attivitaSessualeRapportoProtetto,
  attivitaSessualeRapportoNonProtetto,

  // Desiderio Sessuale
  desiderioSessualeBasso,
  desiderioSessualeMedio,
  desiderioSessualeElevato,

  // Contraccettivi
  contraccettiviNessuno,
  contraccettiviPillolaAnticoncezionale,
  contraccettiviPreservativo,
  contraccettiviAnelloVaginale,
  contraccettiviCerottoAnticoncezionale,
  contraccettiviSpirale,
  contraccettiviDiaframma,
  contraccettiviAltro,

  // Mood
  moodTranquilla,
  moodFelice,
  moodIpersensibile,
  moodTriste,
  moodApatica,
  moodStanca,
  moodArrabbiata,
  moodAutocritica,
  moodVivace,
  moodMotivata,
  moodAnsiosa,
  moodSicura,
  moodIrritabile,
  moodEmotiva,
  moodSbalziDUmore,

  // Livello di Stress
  livelloDiStressZero,
  livelloDiStressGestibile,
  livelloDiStressIntenso,

  // Livello di Energia
  livelloDiEnergiaATerra,
  livelloDiEnergiaNormale,
  livelloDiEnergiaAMille,

  // Attività Fisica
  attivitaFisicaNessuna,
  attivitaFisicaYoga,
  attivitaFisicaAcrobaticaOPilates,
  attivitaFisicaDanza,
  attivitaFisicaPalestra,
  attivitaFisicaSportDiSquadra,
  attivitaFisicaJogging,
  attivitaFisicaCrossfit,
  attivitaFisicaBicicletta,
  attivitaFisicaTrekking,
  attivitaFisicaCamminata,
  attivitaFisicaNuotoOSportDAcqua,
  attivitaFisicaAltro,

  // Pelle
  pelleNormale,
  pelleSeccaESpenta,
  pelleGrassaELucida,
  pelleAcneEBrufoli,
  pellePruritoEIrritazione,

  // Capelli
  capelliNormali,
  capelliCorposiELucenti,
  capelliPesantiEGrassi,
  capelliSecchiESpenti,
  capelliCuteSensibileEIrritata,
  capelliPerditaDiCapelli,

  // Sonno
  sonnoSereno,
  sonnoDifficoltaAdAddormentarsi,
  sonnoAgitato,
  sonnoInsonnia;

  String get title {
    switch (this) {
      // Flusso Mestruale
      case SymptomTitle.flussoMestrualeLeggero:
        return "Leggero";
      case SymptomTitle.flussoMestrualeMedio:
        return "Medio";
      case SymptomTitle.flussoMestrualeAbbondante:
        return "Abbondante";

      // Sintomi
      case SymptomTitle.sintomiCrampi:
        return "Crampi";
      case SymptomTitle.sintomiMalDiSchiena:
        return "Mal di schiena";
      case SymptomTitle.sintomiTensioneAlSeno:
        return "Tensione al seno";
      case SymptomTitle.sintomiGonfiore:
        return "Gonfiore";

      // Attività Sessuale
      case SymptomTitle.attivitaSessualeNessunRapporto:
        return "Nessun rapporto";
      case SymptomTitle.attivitaSessualeRapportoProtetto:
        return "Rapporto protetto";
      case SymptomTitle.attivitaSessualeRapportoNonProtetto:
        return "Rapporto non protetto";

      // Desiderio Sessuale
      case SymptomTitle.desiderioSessualeBasso:
        return "Desiderio sessuale basso";
      case SymptomTitle.desiderioSessualeMedio:
        return "Desiderio sessuale medio";
      case SymptomTitle.desiderioSessualeElevato:
        return "Desiderio sessuale elevato";

      // Contraccettivi
      case SymptomTitle.contraccettiviNessuno:
        return "Nessuno";
      case SymptomTitle.contraccettiviPillolaAnticoncezionale:
        return "Pillola Anticoncezionale";
      case SymptomTitle.contraccettiviPreservativo:
        return "Preservativo";
      case SymptomTitle.contraccettiviAnelloVaginale:
        return "Anello Vaginale";
      case SymptomTitle.contraccettiviCerottoAnticoncezionale:
        return "Cerotto Anticoncezionale";
      case SymptomTitle.contraccettiviSpirale:
        return "Spirale";
      case SymptomTitle.contraccettiviDiaframma:
        return "Diaframma";
      case SymptomTitle.contraccettiviAltro:
        return "Altro";

      // Mood
      case SymptomTitle.moodTranquilla:
        return "Tranquilla";
      case SymptomTitle.moodFelice:
        return "Felice";
      case SymptomTitle.moodIpersensibile:
        return "Ipersensibile";
      case SymptomTitle.moodTriste:
        return "Triste";
      case SymptomTitle.moodApatica:
        return "Apatica";
      case SymptomTitle.moodStanca:
        return "Stanca";
      case SymptomTitle.moodArrabbiata:
        return "Arrabbiata";
      case SymptomTitle.moodAutocritica:
        return "Autocritica";
      case SymptomTitle.moodVivace:
        return "Vivace";
      case SymptomTitle.moodMotivata:
        return "Motivata";
      case SymptomTitle.moodAnsiosa:
        return "Ansiosa";
      case SymptomTitle.moodSicura:
        return "Sicura";
      case SymptomTitle.moodIrritabile:
        return "Irritabile";
      case SymptomTitle.moodEmotiva:
        return "Emotiva";
      case SymptomTitle.moodSbalziDUmore:
        return "Sbalzi d'Umore";

      // Livello di Stress
      case SymptomTitle.livelloDiStressZero:
        return "Zero";
      case SymptomTitle.livelloDiStressGestibile:
        return "Gestibile";
      case SymptomTitle.livelloDiStressIntenso:
        return "Intenso";

      // Livello di Energia
      case SymptomTitle.livelloDiEnergiaATerra:
        return "A terra";
      case SymptomTitle.livelloDiEnergiaNormale:
        return "Normale";
      case SymptomTitle.livelloDiEnergiaAMille:
        return "A mille";

      // Attività Fisica
      case SymptomTitle.attivitaFisicaNessuna:
        return "Nessuna";
      case SymptomTitle.attivitaFisicaYoga:
        return "Yoga";
      case SymptomTitle.attivitaFisicaAcrobaticaOPilates:
        return "Acrobatica o pilates";
      case SymptomTitle.attivitaFisicaDanza:
        return "Danza";
      case SymptomTitle.attivitaFisicaPalestra:
        return "Palestra";
      case SymptomTitle.attivitaFisicaSportDiSquadra:
        return "Sport di squadra";
      case SymptomTitle.attivitaFisicaJogging:
        return "Jogging";
      case SymptomTitle.attivitaFisicaCrossfit:
        return "Crossfit";
      case SymptomTitle.attivitaFisicaBicicletta:
        return "Bicicletta";
      case SymptomTitle.attivitaFisicaTrekking:
        return "Trekking";
      case SymptomTitle.attivitaFisicaCamminata:
        return "Camminata";
      case SymptomTitle.attivitaFisicaNuotoOSportDAcqua:
        return "Nuoto o sport d'acqua";
      case SymptomTitle.attivitaFisicaAltro:
        return "Altro";

      // Pelle
      case SymptomTitle.pelleNormale:
        return "Normale";
      case SymptomTitle.pelleSeccaESpenta:
        return "Secca e spenta";
      case SymptomTitle.pelleGrassaELucida:
        return "Pelle grassa e lucida";
      case SymptomTitle.pelleAcneEBrufoli:
        return "Acne e brufoli";
      case SymptomTitle.pellePruritoEIrritazione:
        return "Prurito e irritazione";

      // Capelli
      case SymptomTitle.capelliNormali:
        return "Normali";
      case SymptomTitle.capelliCorposiELucenti:
        return "Corposi e lucenti";
      case SymptomTitle.capelliPesantiEGrassi:
        return "Pesanti e grassi";
      case SymptomTitle.capelliSecchiESpenti:
        return "Secchi e spenti";
      case SymptomTitle.capelliCuteSensibileEIrritata:
        return "Cute Sensibile e irritata";
      case SymptomTitle.capelliPerditaDiCapelli:
        return "Perdita di capelli";

      // Sonno
      case SymptomTitle.sonnoSereno:
        return "Sereno";
      case SymptomTitle.sonnoDifficoltaAdAddormentarsi:
        return "Difficoltà ad addormentarsi";
      case SymptomTitle.sonnoAgitato:
        return "Agitato";
      case SymptomTitle.sonnoInsonnia:
        return "Insonnia";
    }
  }
}
