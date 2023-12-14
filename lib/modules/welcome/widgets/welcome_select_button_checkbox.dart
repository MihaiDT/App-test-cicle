import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/theme_color.dart';
import '../../../core/theme/theme_gradient.dart';
import '../../../core/theme/theme_icon.dart';

class WelcomeSelectButtonCheck extends StatelessWidget {
  final bool selected;

  const WelcomeSelectButtonCheck({
    required this.selected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 26,
      decoration: selected ? _stateBackGroundOn : _stateBackGroundOff,
      child: selected ? _stateIconOn : null,
    );
  }

  BoxDecoration get _stateBackGroundOn {
    return BoxDecoration(
      gradient: ThemeGradient.primary,
      shape: BoxShape.circle,
    );
  }

  BoxDecoration get _stateBackGroundOff {
    return BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: ThemeColor.whiteDark,
        width: 2,
      ),
    );
  }

  //REVISIT LATER
  SvgPicture get _stateIconOn {
    return SvgPicture.asset(
      ThemeIcon.checkMark,
      fit: BoxFit.scaleDown,
    );
  }
}
