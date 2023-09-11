import 'package:flutter/material.dart';

import '../../app_theme.dart';

class DecorationImagesTheme {
  DecorationImage get bgDark => DecorationImage(
        image: AssetImage(AppTheme.images.bgDark),
        fit: BoxFit.cover,
      );
}
