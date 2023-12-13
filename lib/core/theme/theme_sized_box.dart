import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_theme.dart';

extension ThemeSizedBox on SizedBox {
  /// Height
  static SizedBox get height4 => SizedBox(height: 4.sp);
  static SizedBox get height8 => SizedBox(height: 8.sp);
  static SizedBox get height12 => SizedBox(height: 12.sp);
  static SizedBox get height16 => SizedBox(height: 16.sp);
  static SizedBox get height20 => SizedBox(height: 20.sp);
  static SizedBox get height24 => SizedBox(height: 24.sp);
  static SizedBox get height32 => SizedBox(height: 32.sp);
  static SizedBox get height36 => SizedBox(height: 36.sp);
  static SizedBox get height40 => SizedBox(height: 40.sp);
  static SizedBox get height48 => SizedBox(height: 48.sp);
  static SizedBox get height60 => SizedBox(height: 60.sp);

  /// Width
  static SizedBox get width4 => SizedBox(width: 4.sp);
  static SizedBox get width8 => SizedBox(width: 8.sp);
  static SizedBox get width12 => SizedBox(width: 12.sp);
  static SizedBox get width16 => SizedBox(width: 16.sp);
  static SizedBox get width20 => SizedBox(width: 20.sp);
  static SizedBox get width24 => SizedBox(width: 24.sp);
  static SizedBox get width32 => SizedBox(width: 32.sp);
  static SizedBox get width36 => SizedBox(width: 36.sp);
  static SizedBox get width40 => SizedBox(width: 40.sp);
  static SizedBox get width48 => SizedBox(width: 48.sp);
  static SizedBox get width60 => SizedBox(width: 60.sp);

  /// SafeArea
  static SizedBox get heightAppBarDefault =>
      SizedBox(height: ThemeSize.heightAppBarDefault);
  static SizedBox get heightBottomSafeArea =>
      SizedBox(height: ThemeSize.heightSafeAreaBottom);
  static SizedBox get heightTopSafeArea =>
      SizedBox(height: ThemeSize.heightSafeAreaTop);
}
