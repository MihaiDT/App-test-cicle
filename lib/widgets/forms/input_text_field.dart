import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/enums/background_type.dart';

class InputTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final bool isPassword;
  final bool isDisabled;
  final bool hasError;
  final bool isRequired;
  final String label;
  final String? placeholder;
  final bool multiline;
  final bool obscureText;
  final TextInputType keyboardType; // Default: .text
  final double contentPaddingLeft;
  final TextAlign textAlign;
  final TextCapitalization? textCapitalization;
  final TextEditingController textEditingController;
  final TextInputAction textInputAction;
  final GestureTapCallback? onTapTogglePassword;
  final Function? onEditingComplete;
  final Function? onSubmitted;
  final Function(String txt)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String errorMessage;
  final BackgroundType backgroundType;

  const InputTextField({
    super.key,
    this.focusNode,
    this.isPassword = false,
    this.errorMessage = "",
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
    this.onSubmitted,
    this.onTapTogglePassword,
    this.placeholder,
    this.contentPaddingLeft = 32,
    this.textAlign = TextAlign.left,
    this.textCapitalization,
    required this.textEditingController,
    this.textInputAction = TextInputAction.next,
    this.backgroundType = BackgroundType.dark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _label(context),
        TextFormField(
          focusNode: focusNode,
          textAlign: textAlign,
          controller: textEditingController,
          enableSuggestions: false,
          decoration: isPassword
              ? textFieldPasswordDecoration(
                  label,
                  hasError: hasError,
                  isDisabled: isDisabled,
                  obscureText: obscureText,
                  placeholder: placeholder,
                  onTapTogglePassword: onTapTogglePassword,
                  backgroundType: backgroundType,
                )
              : textFieldDefaultDecoration(
                  label,
                  hasError: hasError,
                  isDisabled: isDisabled,
                  placeholder: placeholder,
                  paddingLeft:
                      textAlign == TextAlign.center ? null : contentPaddingLeft,
                  backgroundType: backgroundType,
                ),
          style: ThemeTextStyle.bodyMedium.copyWith(
            color: backgroundType == BackgroundType.light
                ? ThemeColor.darkBlue
                : ThemeColor.whiteDark,
          ),
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          maxLines: multiline ? 5 : 1,
          obscureText: obscureText,
          onChanged: (value) => onChanged != null ? onChanged!(value) : {},
          onEditingComplete: () =>
              onEditingComplete != null ? onEditingComplete!() : {},
          onFieldSubmitted: (value) =>
              onSubmitted != null ? onSubmitted!(value) : {},
          scrollPadding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          textCapitalization:
              textCapitalization ?? TextCapitalization.sentences,
          textInputAction: textInputAction,
          textAlignVertical: TextAlignVertical.center,
          autocorrect: false,
        ),
        if (hasError && errorMessage.isNotEmpty) _errorLabels(),
      ],
    );
  }

  Widget _label(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 32,
        bottom: 4,
      ),
      child: backgroundType == BackgroundType.light
          ? TitleMedium(
              label.toUpperCase(),
            ).applyShaders(context)
          : TitleMedium(
              label.toUpperCase(),
            ),
    );
  }

  Widget _errorLabels() {
    return Column(
      children: [
        ThemeSizedBox.height12,
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: BodyMedium(
              errorMessage,
              color: ThemeColor.menstruationColor,
            ),
          ),
        ),
      ],
    );
  }
}
