import 'package:flutter/material.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_sized_box.dart';

class DividerSection extends StatelessWidget {
  final Color color;

  const DividerSection({
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              color: color,
              height: 2,
            ),
          ),
          ThemeSizedBox.width12,
          TitleMedium(
            "OPPURE",
            color: color,
          ),
          ThemeSizedBox.width12,
          Expanded(
            child: Container(
              color: color,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}
