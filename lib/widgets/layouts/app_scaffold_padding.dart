import 'package:flutter/material.dart';

import '../../core/app_theme.dart';

class AppScaffoldPadding extends StatelessWidget {
  final double? bottom;
  final Widget child;
  final double? top;
  final bool sidePaddingLarge;

  const AppScaffoldPadding({
    super.key,
    this.bottom,
    required this.child,
    this.top,
    this.sidePaddingLarge = true,
  });

  @override
  SafeArea build(BuildContext context) {
    return SafeArea(
      // Use the combined viewInsets and viewPadding to add spacing on all sides
      maintainBottomViewPadding: true,
      // Use the combined viewInsets and viewPadding to add spacing on all sides

      child: padding(context),
    );
  }

  Widget padding(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: paddingLeft(context),
        top: top ?? paddingTop(context),
        right: paddingRight(context),
        bottom: bottom ?? paddingBottom(context),
      ),
      child: child,
    );
  }

  /// Private methods

  MediaQueryData _mediaQueryData(BuildContext context) {
    // Accessing the MediaQueryData to get the viewInsets and viewPadding
    // https://syedabdulbasit7.medium.com/annoying-keyboard-overlaps-understanding-flutters-padding-vs-viewpadding-vsviewinsets-oh-my-6e3214866e43
    return MediaQuery.of(context);
  }

  double paddingBottom(BuildContext context) =>
      _mediaQueryData(context).viewInsets.bottom +
      // _mediaQueryData(context).viewPadding.bottom +
      20;

  double paddingLeft(BuildContext context) =>
      _mediaQueryData(context).viewInsets.left +
      // _mediaQueryData(context).viewPadding.left +
      (sidePaddingLarge
          ? ThemeSize.paddingLarge
          : ThemeSize.paddingMedium);

  double paddingRight(BuildContext context) =>
      _mediaQueryData(context).viewInsets.right +
      // _mediaQueryData(context).viewPadding.right +
      (sidePaddingLarge
          ? ThemeSize.paddingLarge
          : ThemeSize.paddingMedium);

  double paddingTop(BuildContext context) => _mediaQueryData(context)
      .viewInsets
      .top; // + _mediaQueryData(context).viewPadding.top;
}
