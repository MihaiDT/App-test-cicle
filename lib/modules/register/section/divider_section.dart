import 'package:flutter/material.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_color.dart';
import 'package:lines/core/theme/theme_sized_box.dart';

class DividerSection extends StatelessWidget {
  const DividerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              color: ThemeColor.whiteDark,
              height: 2,
            ),
          ),
          ThemeSizedBox.width12,
          const TitleMedium("OPPURE"),
          ThemeSizedBox.width12,
          Expanded(
            child: Container(
              color: ThemeColor.whiteDark,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}
