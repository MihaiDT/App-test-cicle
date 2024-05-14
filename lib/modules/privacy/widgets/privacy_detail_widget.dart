import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/forms/rounded_checkbox.dart';

class PrivacyDetailWidget extends StatelessWidget {
  final String title;
  final String description;
  final bool value;
  final Function(bool value) onChanged;

  const PrivacyDetailWidget({
    required this.title,
    required this.description,
    required this.onChanged,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IgnorePointer(
            child: RoundedCheckbox(
              value: value,
              onChanged: (p0) {},
            ),
          ),
          ThemeSizedBox.width16,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadlineMedium(
                  title,
                ),
                ThemeSizedBox.height8,
                BodyMedium(
                  description,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
