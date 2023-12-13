import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/theme/theme_icon.dart';

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TransparentAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: const SizedBox(),
      actions: [
        const SizedBox(
          width: 16,
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset(
            ThemeIcon.back,
            width: 24,
            height: 24,
          ),
        ),
        const Spacer(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
