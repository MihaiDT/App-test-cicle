// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:lines/core/app_theme.dart';

class AgreeCheckButtons extends StatefulWidget {
  bool agree;
  final void Function(bool) onChanged;

  AgreeCheckButtons({
    super.key,
    this.agree = false,
    required this.onChanged,
  });

  @override
  State<AgreeCheckButtons> createState() => _AgreeCheckButtonsState();
}

class _AgreeCheckButtonsState extends State<AgreeCheckButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        _agreeButton(),
        ThemeSizedBox.width16,
        _notAgreeButton(),
      ],
    );
  }

  Widget _agreeButton() {
    final border = !widget.agree
        ? GradientBoxBorder(
            gradient: ThemeGradient.primary,
            width: 2,
          )
        : Border.all(
            color: Colors.transparent,
            width: 2,
          );

    final gradient = widget.agree
        ? const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFB63AB4),
              Color(0xFF513B9F),
            ],
          )
        : null;

    return InkWell(
      onTap: () => setState(() {
        widget.agree = true;
        widget.onChanged(true);
      }),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          border: border,
          color: Colors.white,
          gradient: gradient,
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
            widget.agree
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: border,
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
                      border: border,
                      color: Colors.white,
                    ),
                    height: 24,
                    width: 24,
                  ),
            ThemeSizedBox.width8,
            widget.agree
                ? const TitleMedium("Acconsento")
                : const TitleMedium("Acconsento").applyShaders(context),
          ],
        ),
      ),
    );
  }

  Widget _notAgreeButton() {
    final border = widget.agree
        ? GradientBoxBorder(
            gradient: ThemeGradient.primary,
            width: 2,
          )
        : Border.all(
            color: Colors.transparent,
            width: 2,
          );

    final gradient = !widget.agree
        ? const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFB63AB4),
              Color(0xFF513B9F),
            ],
          )
        : null;

    return InkWell(
      onTap: () => setState(() {
        widget.agree = false;
        widget.onChanged(false);
      }),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          border: border,
          color: Colors.white,
          gradient: gradient,
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
            !widget.agree
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: border,
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
                      border: border,
                      color: Colors.white,
                    ),
                    height: 24,
                    width: 24,
                  ),
            ThemeSizedBox.width8,
            !widget.agree
                ? const TitleMedium("Non acconsento")
                : const TitleMedium("Non acconsento").applyShaders(context),
          ],
        ),
      ),
    );
  }
}
