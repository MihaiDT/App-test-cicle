import 'package:flutter/material.dart';
import 'welcome_highlighted_box.dart';
import 'welcome_select_button_checkbox.dart';
import 'welcome_select_title.dart';

class WelcomeSelectButton extends StatelessWidget {
  final bool selected;
  final String title;

  const WelcomeSelectButton({
    required this.title,
    required this.selected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HighlightedBox(
      selected: selected,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 17,
          left: 24,
          right:8,
          top: 17,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WelcomeSelectTitle(
              selected: selected,
              title: title,
            ),
            WelcomeSelectButtonCheck(
              selected: selected,
            ),
          ],
        ),
      ),
    );
  }
}
