import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final List<Widget> actions;
  final Color? backButtonColor;

  final GestureTapCallback? onBackPressed;

  const TransparentAppBar({
    this.title,
    this.actions = const [],
    this.backButtonColor,
    this.leading,
    this.onBackPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      leading: leading ?? _leading,
      title: title ?? const SizedBox(),
      centerTitle: true,
      actions: [
        ...actions,
        ThemeSizedBox.width16,
      ],
    );
  }

  Widget get _leading {
    return GestureDetector(
      onTap: () {
        onBackPressed?.call();
        Navigator.pop(Get.context!);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
          vertical: 6,
        ), // Leading with defaults to 56
        child: SvgPicture.asset(
          ThemeIcon.back,
          width: 24,
          height: 24,
          color: backButtonColor ?? Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
