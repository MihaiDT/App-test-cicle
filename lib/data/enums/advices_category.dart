import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

enum AdvicesCategory {
  ginecologia,
  sessualitaEFertilita,
  tabueEInclusivita,
  fitnessAndWellness,
  beautyAndLifestyle,
  alimentazione,
  benessereEmotivo,
  linesAlTuoFianco;

  String get categoryTitle => name;

  Color get categoryColor {
    switch (this) {
      case AdvicesCategory.ginecologia:
        return ThemeColor.ginecologiaColor;
      case AdvicesCategory.sessualitaEFertilita:
        return ThemeColor.sessualitaEFertilitaColor;
      case AdvicesCategory.tabueEInclusivita:
        return ThemeColor.tabuEInclusivitaColor;
      case AdvicesCategory.fitnessAndWellness:
        return ThemeColor.fitnessAndWellnessColor;
      case AdvicesCategory.beautyAndLifestyle:
        return ThemeColor.beautyAndLifestyleColor;
      case AdvicesCategory.alimentazione:
        return ThemeColor.alimentazioneColor;
      case AdvicesCategory.benessereEmotivo:
        return ThemeColor.benessereEmotivoColor;
      case AdvicesCategory.linesAlTuoFianco:
        return ThemeColor.linesAlTuoFiancoColor;
    }
  }

  String get iconPath {
    switch (this) {
      case AdvicesCategory.ginecologia:
        return ThemeIcon.ginecologia;
      case AdvicesCategory.sessualitaEFertilita:
        return ThemeIcon.sessualitaEFertilita;
      case AdvicesCategory.tabueEInclusivita:
        return ThemeIcon.tabueEInclusivita;
      case AdvicesCategory.fitnessAndWellness:
        return ThemeIcon.fitnessAndWellness;
      case AdvicesCategory.beautyAndLifestyle:
        return ThemeIcon.beautyAndLifestyle;
      case AdvicesCategory.alimentazione:
        return ThemeIcon.alimentazione;
      case AdvicesCategory.benessereEmotivo:
        return ThemeIcon.benessereEmotivo;
      case AdvicesCategory.linesAlTuoFianco:
        return ThemeIcon.linesAlTuoFianco;
    }
  }
}
