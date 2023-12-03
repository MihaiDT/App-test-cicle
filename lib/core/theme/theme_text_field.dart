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
  String? placeholder,
}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 22,
    ),
    disabledBorder: disabledOutlineInputBorder,
    enabled: !isDisabled,
    enabledBorder: hasError ? errorOutlineInputBorder : enabledOutlineInputBorder,
    errorText: null, //  Gestisco a mano l'errore
    floatingLabelBehavior: FloatingLabelBehavior.never,
    fillColor: Colors.transparent,
    focusedBorder: hasError ? errorOutlineInputBorder : focusedOutlineInputBorder,
    focusedErrorBorder: errorOutlineInputBorder,
    focusColor: ThemeColor.whiteDark,
    hintMaxLines: 1,
    hintStyle: ThemeTextStyle.placeholderLight,
    hintText: placeholder ?? label,
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
              obscureText ? ThemeIcon.passwordHidden : ThemeIcon.passwordHidden,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      suffixIconConstraints: const BoxConstraints(
        maxHeight: 20,
        minWidth: 20,
      ),
    );

// InputDecoration textFieldDefaultDecoration(
//   String label, {
//   bool isDisabled = false,
//   bool hasError = false,
//   String? placeholder,
// }) =>
//     InputDecoration(
//       contentPadding: const EdgeInsets.all(16),
//       enabled: !isDisabled,
//       disabledBorder: disabledOutlineInputBorder,
//       enabledBorder: hasError ? errorOutlineInputBorder : enabledOutlineInputBorder,
//       // errorBorder: errorOutlineInputBorder,
//       errorText: null, //  Gestisco a mano l'errore
//       errorStyle: textStyleError,
//       floatingLabelBehavior: FloatingLabelBehavior.auto,
//       floatingLabelStyle: hasError ? textStyleInputFloatingLabelError : textStyleInputFloatingLabel,
//       fillColor: ThemeColor.background,
//       filled: true,
//       focusedBorder: hasError ? errorOutlineInputBorder : focusedOutlineInputBorder,
//       focusedErrorBorder: errorOutlineInputBorder,
//       focusColor: ThemeColor.primary,
//       hintStyle: textStyleInputPlaceholder,
//       hintText: placeholder ?? label,
//       labelText: label,
//       labelStyle: textStyleInputPlaceholder,
//     );

// InputDecoration _disabledDecoration(
//   String label, {
//   String? placeholder,
//   required bool obscureText,
// }) =>
//     textFieldDefaultDecoration(
//       label,
//       isDisabled: true,
//       placeholder: placeholder,
//     ).copyWith(
//       suffixIcon: Padding(
//         padding: const EdgeInsets.only(right: 8),
//         child: SizedBox(
//           height: 40,
//           width: 40,
//           child: SvgPicture.asset(
//             AppIcon.inputDisabled.path!,
//             color: ThemeColor.primary,
//             fit: BoxFit.contain,
//           ),
//         ),
//       ),
//       suffixIconConstraints: const BoxConstraints(
//         maxHeight: 20,
//         minWidth: 20,
//       ),
//     );

// InputDecoration passwordDecoration(
//   String label, {
//   bool isDisabled = false,
//   bool hasError = false,
//   String? placeholder,
//   required bool obscureText,
//   required GestureTapCallback? onTapTogglePassword,
// }) =>
//     textFieldDefaultDecoration(
//       label,
//       isDisabled: isDisabled,
//       hasError: hasError,
//       obscureText: obscureText,
//       placeholder: placeholder,
//     ).copyWith(
//       suffixIcon: Padding(
//         child: InkWell(
//           child: SizedBox(
//             child: SvgPicture.asset(
//               obscureText ? AppIcon.inputPasswordHidden.path! : AppIcon.inputPasswordVisible.path!,
//               color: hasError ? Colors.red : ThemeColor.primary,
//               fit: BoxFit.contain,
//             ),
//             height: 40,
//             width: 40,
//           ),
//           onTap: onTapTogglePassword,
//         ),
//         padding: const EdgeInsets.only(right: 8),
//       ),
//       suffixIconConstraints: const BoxConstraints(
//         maxHeight: 20,
//         minWidth: 20,
//       ),
//     );
