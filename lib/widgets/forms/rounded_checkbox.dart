import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/theme/theme_icon.dart';

class RoundedCheckbox extends StatefulWidget {
  final bool value;

  final void Function(bool) onChanged;

  const RoundedCheckbox({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  State<RoundedCheckbox> createState() => _RoundedCheckboxState();
}

class _RoundedCheckboxState extends State<RoundedCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: widget.value
          ? SvgPicture.asset(
              ThemeIcon.checkboxFilled,
              width: 24,
            )
          : SvgPicture.asset(
              ThemeIcon.checkboxOutline,
            ),
    );
  }
}
