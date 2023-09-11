import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lines/core/app_theme.dart';

class FontStylesTheme {
  static const weightMedium = FontWeight.w500;
  static const weightRegular = FontWeight.w400;
  static const weightSemibold = FontWeight.w600;

  TextStyle get largeLight => GoogleFonts.barlow(
        color: Colors.white,
        fontSize: 25.sp,
        fontWeight: weightMedium,
        height: 1.1.sp,
      );

  TextStyle get largeDark => largeLight.copyWith(color: AppTheme.colors.primary);

  TextStyle get mediumLight => GoogleFonts.barlow(
        color: Colors.white,
        fontSize: 16.5.sp,
        fontWeight: weightMedium,
        height: 1.4.sp,
      );
  TextStyle get mediumDark => mediumLight.copyWith(color: AppTheme.colors.primary);

  TextStyle get bodyLight => GoogleFonts.barlow(
        color: Colors.white,
        fontSize: 14.5.sp,
        fontWeight: weightMedium,
        height: 1.4.sp,
      );

  TextStyle get bodyDark => bodyLight.copyWith(color: AppTheme.colors.primary);

  TextStyle get button => GoogleFonts.barlow(
        color: Colors.white,
        fontSize: 16.sp,
        fontWeight: weightSemibold,
        height: 1.4.sp,
      );

  // ShaderMask(
  //                 blendMode: BlendMode.srcIn,
  //                 shaderCallback: (bounds) =>
  //                     const LinearGradient(colors: [kSecondaryColor, kPrimaryColor]).createShader(
  //                   Rect.fromLTWH(0, 0, bounds.width, bounds.height),
  //                 ),
  //                 child: Text(
  //                   event.title,
  //                   style: kEventTitleTextStyle,
  //                 ),
  //               ),
}
