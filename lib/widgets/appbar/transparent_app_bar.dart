import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/theme/theme_icon.dart';

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final List<Widget> actions;

  const TransparentAppBar({
    this.title,
    this.actions = const [],
    this.leading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeSize.paddingSmall,
        vertical: 6,
      ), // Leading with defaults to 56
      child: SvgPicture.asset(
        ThemeIcon.back,
        width: 24,
        height: 24,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
