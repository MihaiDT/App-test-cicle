import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_theme.dart';

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
  double paddingLeft = 32,
  String? placeholder,
}) {
  return InputDecoration(
    contentPadding: EdgeInsets.only(
      top: 18,
      left: paddingLeft,
      bottom: 18,
    ),

    filled: hasError,
    disabledBorder: disabledOutlineInputBorder,
    enabled: !isDisabled,
    enabledBorder: enabledOutlineInputBorder,
    errorText: null,
    //  Gestisco a mano l'errore
    floatingLabelBehavior: FloatingLabelBehavior.never,
    fillColor: ThemeColor.cicloColor,
    focusedBorder: focusedOutlineInputBorder,
    focusedErrorBorder: errorOutlineInputBorder,
    focusColor: ThemeColor.whiteDark,
    hintMaxLines: 1,
    hintStyle: NewThemeTextStyle.bodyMedium.copyWith(
      color: ThemeColor.whiteDark,
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
                color: ThemeColor.cicloColor,
                height: 12,
              ),
            ),
          )
        : const SizedBox(),
  );
}

InputDecoration textFieldPasswordDecoration(
  String label, {
  bool isDisabled = false,
  bool hasError = false,
  String? placeholder,
  required bool obscureText,
  required GestureTapCallback? onTapTogglePassword,
}) =>
    textFieldDefaultDecoration(
      label,
      isDisabled: isDisabled,
      hasError: hasError,
      placeholder: placeholder,
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
