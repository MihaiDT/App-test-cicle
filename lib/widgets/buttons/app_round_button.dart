import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:lines/core/app_theme.dart';

class AppRoundButton extends StatelessWidget {
  final double borderWidth;
  final Color? iconColor;
  final String iconPath;
  final double radius;
  final Color unselectedBorderColor;
  final Color unselectedBackGroundColor;
  final bool value;
  final bool unselectedBorderGradient;
  final ValueChanged<bool> onChanged;

  const AppRoundButton({
    this.borderWidth = 1.0,
    this.iconColor,
    this.unselectedBorderGradient = true,
    required this.iconPath,
    this.radius = 16.0,
    this.unselectedBorderColor = Colors.transparent,
    this.unselectedBackGroundColor = Colors.transparent,
    super.key,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: value ? _onState : _offState,
    );
  }

  Widget get _offState {
    return Container(
      decoration: BoxDecoration(
        border: _borderUnselected,
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        backgroundColor: unselectedBackGroundColor,
        radius: radius,
      ),
    );
  }

  Widget get _onState {
    return Container(
      decoration: BoxDecoration(
        gradient: ThemeGradient.primary,
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: radius,
        child: SvgPicture.asset(
          iconPath,
          color: iconColor,
        ),
      ),
    );
  }

  BoxBorder? get _borderUnselected {
    if (unselectedBorderGradient) {
      return GradientBoxBorder(
        gradient: ThemeGradient.primary,
        width: borderWidth,
      );
    }
    return Border.all(
      color: unselectedBorderColor,
      width: borderWidth,
    );
  }
}
