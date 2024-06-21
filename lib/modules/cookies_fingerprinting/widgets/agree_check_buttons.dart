// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:lines/core/app_theme.dart';

class AgreeCheckButtons extends StatefulWidget {
  final bool? value;
  final bool? groupValue;
  final String text;
  final void Function(bool?) onChanged;

  const AgreeCheckButtons({
    super.key,
    this.value,
    required this.groupValue,
    required this.text,
    required this.onChanged,
  });

  @override
  State<AgreeCheckButtons> createState() => _AgreeCheckButtonsState();
}

class _AgreeCheckButtonsState extends State<AgreeCheckButtons> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.groupValue == null) {
          widget.onChanged(true);
        } else {
          widget.onChanged(widget.value);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          border: border(_isSelected),
          color: Colors.white,
          gradient: gradient(_isSelected),
        ),
        padding: const EdgeInsets.only(
          left: 6,
          top: 6,
          bottom: 6,
          right: 10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _isSelected
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: border(_isSelected),
                      color: Colors.white,
                    ),
                    height: 24,
                    width: 24,
                    child: Center(
                      child: SvgPicture.asset(
                        ThemeIcon.check,
                        fit: BoxFit.scaleDown,
                        height: 24,
                        width: 10,
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: border(_isSelected),
                      color: Colors.white,
                    ),
                    height: 24,
                    width: 24,
                  ),
            ThemeSizedBox.width8,
            _isSelected
                ? TitleMedium(widget.text)
                : TitleMedium(widget.text).applyShaders(context),
          ],
        ),
      ),
    );
  }

  LinearGradient? gradient(bool? isSelected) {
    return isSelected == true
        ? const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFB63AB4),
              Color(0xFF513B9F),
            ],
          )
        : null;
  }

  BoxBorder border(bool? isSelected) {
    return isSelected == false
        ? GradientBoxBorder(
            gradient: ThemeGradient.primary,
            width: 2,
          )
        : Border.all(
            color: Colors.transparent,
            width: 2,
          );
  }

  bool get _isSelected => widget.groupValue == widget.value;
}
