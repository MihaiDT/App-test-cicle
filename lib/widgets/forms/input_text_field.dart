import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/app_theme.dart';

class InputTextField extends StatelessWidget {
  final bool isPassword;

  final bool isDisabled;
  final bool hasError;
  final bool isRequired;

  final String label;
  final String? placeholder;
  final bool multiline;
  final bool obscureText;
  final TextInputType keyboardType; // Default: .text
  final TextCapitalization? textCapitalization;
  final TextEditingController textEditingController;
  final TextInputAction textInputAction;
  final GestureTapCallback? onTapTogglePassword;
  final Function? onEditingComplete;
  final Function(String txt)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final List<String>? errorMessages;

  const InputTextField({
    super.key,
    this.isPassword = false,
    this.errorMessages,
    this.isDisabled = false,
    this.isRequired = false,
    this.hasError = false,
    this.keyboardType = TextInputType.text,
    this.multiline = false,
    this.inputFormatters,
    required this.label,
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.onTapTogglePassword,
    this.placeholder,
    this.textCapitalization,
    required this.textEditingController,
    this.textInputAction = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _label(),
        TextFormField(
          controller: textEditingController,
          decoration: isPassword
              ? textFieldPasswordDecoration(
                  label,
                  hasError: hasError,
                  isDisabled: isDisabled,
                  obscureText: obscureText,
                  placeholder: placeholder,
                  onTapTogglePassword: onTapTogglePassword,
                )
              : textFieldDefaultDecoration(
                  label,
                  hasError: hasError,
                  isDisabled: isDisabled,
                  placeholder: placeholder,
                ),
          style: ThemeTextStyle.placeholderLight,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          maxLines: multiline ? 5 : 1,
          obscureText: obscureText,
          onChanged: (value) => onChanged != null ? onChanged!(value) : {},
          onEditingComplete: () =>
              onEditingComplete != null ? onEditingComplete!() : {},
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 20),
          textCapitalization:
              textCapitalization ?? TextCapitalization.sentences,
          textInputAction: textInputAction,
          textAlignVertical: TextAlignVertical.center,
        ),
        if (hasError) _errorLabels(),
      ],
    );
  }

  Widget _label() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        bottom: 4,
      ),
      child: Text(
        label.toUpperCase(),
        style: ThemeTextStyle.labelLight, // FIXME:
      ),
    );
  }

  Widget _errorLabels() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        ThemeSizedBox.width12,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ThemeSizedBox.height4,
            // SvgPicture.asset(
            //   AppIcon.alertIcon.path!,
            //   fit: BoxFit.fitWidth,
            //   height: 16,
            //   width: 16,
            // ),
          ],
        ),
        ThemeSizedBox.width4,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 6,
            ),
            ...(errorMessages ?? [])
                .map(
                  (message) => Text(
                    message,
                    style: ThemeTextStyle.bodyLight,
                  ),
                )
                .toList(),
          ],
        ),
      ],
    );
  }
}
