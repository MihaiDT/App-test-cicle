import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/widgets/forms/rounded_checkbox.dart';

class PrivacyDetailWidget extends StatefulWidget {
  final String title;
  final String description;

  const PrivacyDetailWidget({
    required this.title,
    required this.description,
    super.key,
  });

  @override
  State<PrivacyDetailWidget> createState() => _PrivacyDetailWidgetState();
}

class _PrivacyDetailWidgetState extends State<PrivacyDetailWidget> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundedCheckbox(
          value: value,
          onChanged: (p0) {
            setState(() {
              value = p0;
            });
          },
        ),
        ThemeSizedBox.width16,
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadlineMedium(
                widget.title,
              ),
              ThemeSizedBox.height8,
              BodyMedium(
                widget.description,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
