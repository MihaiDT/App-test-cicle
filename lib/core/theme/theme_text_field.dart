import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/enums/background_type.dart';

final enabledOutlineInputBorder = OutlineInputBorder(
  borderSide: const BorderSide(
    color: Colors.white,
    width: 2,
  ),
  borderRadius: BorderRadius.circular(32),
);

final disabledOutlineInputBorder = OutlineInputBorder(
  borderSide: const BorderSide(
    color: Colors.grey,
    width: 2,
  ),
  borderRadius: BorderRadius.circular(32),
);

final focusedOutlineInputBorder = OutlineInputBorder(
  borderSide: const BorderSide(
    color: Colors.white,
    width: 2,
  ),
  borderRadius: BorderRadius.circular(32),
);

final errorOutlineInputBorder = OutlineInputBorder(
  borderSide: const BorderSide(
    color: Colors.red,
    width: 2,
  ),
  borderRadius: BorderRadius.circular(32),
);

InputDecoration textFieldDefaultDecoration(
  String label, {
  required bool isDisabled,
  required bool hasError,
  double? paddingLeft,
  String? placeholder,
  required BackgroundType backgroundType,
}) {
  return InputDecoration(
    contentPadding: paddingLeft != null
        ? EdgeInsets.only(
            top: 18,
            left: paddingLeft,
            bottom: 18,
          )
        : null,
    filled: hasError,
    disabledBorder: disabledOutlineInputBorder.copyWith(
      borderSide: backgroundType == BackgroundType.light
          ? const BorderSide(
              color: ThemeColor.brightPink,
              width: 2,
            )
          : null,
    ),
    enabled: !isDisabled,
    enabledBorder: enabledOutlineInputBorder.copyWith(
      borderSide: backgroundType == BackgroundType.light
          ? const BorderSide(
              color: ThemeColor.brightPink,
              width: 2,
            )
          : null,
    ),
    errorText: null,
    //  Gestisco a mano l'errore
    floatingLabelBehavior: FloatingLabelBehavior.never,
    fillColor: ThemeColor.menstruationColor,
    focusedBorder: focusedOutlineInputBorder.copyWith(
      borderSide: backgroundType == BackgroundType.light
          ? const BorderSide(
              color: ThemeColor.brightPink,
              width: 2,
            )
          : null,
    ),
    focusedErrorBorder: errorOutlineInputBorder,
    focusColor: backgroundType == BackgroundType.light
        ? ThemeColor.darkBlue
        : ThemeColor.whiteDark,
    hintMaxLines: 1,
    hintStyle: ThemeTextStyle.bodyMedium.copyWith(
      color: backgroundType == BackgroundType.light
          ? ThemeColor.darkBlue
          : ThemeColor.whiteDark,
      letterSpacing: 0,
    ),
    hintText: placeholder ?? label,
    suffixIcon: hasError
        ? Padding(
            padding: const EdgeInsets.only(
              right: 16.0,
            ),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                ThemeIcon.close,
                color: ThemeColor.menstruationColor,
                height: 12,
              ),
            ),
          )
        : null,
  );
}

InputDecoration textFieldPasswordDecoration(
  String label, {
  bool isDisabled = false,
  bool hasError = false,
  String? placeholder,
  required bool obscureText,
  required GestureTapCallback? onTapTogglePassword,
  required BackgroundType backgroundType,
}) =>
    textFieldDefaultDecoration(
      label,
      isDisabled: isDisabled,
      hasError: hasError,
      placeholder: placeholder,
      paddingLeft: 32,
      backgroundType: backgroundType,
    ).copyWith(
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: InkWell(
          onTap: onTapTogglePassword,
          child: SizedBox(
            height: 40,
            width: 40,
            child: SvgPicture.asset(
              obscureText ? ThemeIcon.eyeClosed : ThemeIcon.eyeOpened,
              color: Colors.white,
            ),
          ),
        ),
      ),
      suffixIconConstraints: const BoxConstraints(
        maxHeight: 20,
        minWidth: 20,
      ),
    );
