import 'package:flutter/material.dart';

import 'package:lines/core/app_theme.dart';

class AdvicesCategory {
  final String iconName;
  final String? categoryTitle;

  AdvicesCategory({
    required this.iconName,
    this.categoryTitle,
  });

  factory AdvicesCategory.fromJson(Map<String, dynamic> data) {
    return AdvicesCategory(
      iconName: data['icon_name'],
      categoryTitle: data['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iconName': iconName,
      'categoryTitle': categoryTitle,
    };
  }

  Color get categoryColor {
    switch (iconName) {
      case 'ginecologia.svg':
        return ThemeColor.ginecologiaColor;
      case 'sessualita_e_fertilita.svg':
        return ThemeColor.sessualitaEFertilitaColor;
      case 'tabu_e_inclusivita.svg':
        return ThemeColor.tabuEInclusivitaColor;
      case 'fitness_and_wellness.svg':
        return ThemeColor.fitnessAndWellnessColor;
      case 'beauty_and_lifestyle.svg':
        return ThemeColor.beautyAndLifestyleColor;
      case 'alimentazione.svg':
        return ThemeColor.alimentazioneColor;
      case 'benessere_emotivo.svg':
        return ThemeColor.benessereEmotivoColor;
      case 'lines_al_tuo_fianco.svg':
        return ThemeColor.linesAlTuoFiancoColor;
      default:
        return Colors.white;
    }
  }

  String get iconPath {
    switch (iconName) {
      case 'ginecologia.svg':
        return ThemeIcon.ginecologia;
      case 'sessualita_e_fertilita.svg':
        return ThemeIcon.sessualitaEFertilita;
      case 'tabu_e_inclusivita.svg':
        return ThemeIcon.tabueEInclusivita;
      case 'fitness_and_wellness.svg':
        return ThemeIcon.fitnessAndWellness;
      case 'beauty_and_lifestyle.svg':
        return ThemeIcon.beautyAndLifestyle;
      case 'alimentazione.svg':
        return ThemeIcon.alimentazione;
      case 'benessere_emotivo.svg':
        return ThemeIcon.benessereEmotivo;
      case 'lines_al_tuo_fianco.svg':
        return ThemeIcon.linesAlTuoFianco;
      default:
        return '';
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdvicesCategory &&
          runtimeType == other.runtimeType &&
          iconName == other.iconName;

  @override
  int get hashCode => iconName.hashCode;
}
