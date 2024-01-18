enum SymptomCategoryTitle {
  flussoMestruale,
  sintomi,
  attivitaSessuale,
  desiderioSessuale,
  contraccettivi,
  mood,
  livelloDiStress,
  livelloDiEnergia,
  attivitaFisica,
  pelle,
  capelli,
  sonno;

  String get title {
    switch (this) {
      case SymptomCategoryTitle.flussoMestruale:
        return 'Flusso mestruale';
      case SymptomCategoryTitle.sintomi:
        return 'Sintomi';
      case SymptomCategoryTitle.attivitaSessuale:
        return 'Attivita sessuale';
      case SymptomCategoryTitle.desiderioSessuale:
        return 'Desiderio sessuale';
      case SymptomCategoryTitle.contraccettivi:
        return 'Contraccettivi';
      case SymptomCategoryTitle.mood:
        return 'Mood';
      case SymptomCategoryTitle.livelloDiStress:
        return 'Livello di stress';
      case SymptomCategoryTitle.livelloDiEnergia:
        return 'Livello di energia';
      case SymptomCategoryTitle.attivitaFisica:
        return 'Attività fisica';
      case SymptomCategoryTitle.pelle:
        return 'Pelle';
      case SymptomCategoryTitle.capelli:
        return 'Capelli';
      case SymptomCategoryTitle.sonno:
        return 'Sonno';
    }
  }
}
