import 'package:flutter/material.dart';

import '../../core/theme/theme_color.dart';

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
  
}
