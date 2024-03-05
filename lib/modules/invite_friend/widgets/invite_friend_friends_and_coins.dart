import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lines/core/app_theme.dart';

class InviteFriendFriendsAndCoins extends StatelessWidget {
  final int friendsAmount;
  final int coinsAmount;

  const InviteFriendFriendsAndCoins({
    required this.friendsAmount,
    required this.coinsAmount,
    super.key,
  });

  static const Color _dashColor = Color(0xffe5e1ef);
  static const Color _bgColor = Color(0xfff3eef4);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        decoration: const BoxDecoration(
          color: _bgColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                DisplaySmall(
                  "$friendsAmount",
                  color: ThemeColor.brightPink,
                ),
                ThemeSizedBox.width8,
                const HeadlineSmall(
                  "Amici",
                  color: ThemeColor.darkBlue,
                ),
              ],
            ),
            SizedBox(
              width: 0,
              height: constraints.maxHeight,
              child: DottedBorder(
                color: _dashColor,
                dashPattern: const [5, 10],
                child: const SizedBox.shrink(),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                DisplaySmall(
                  "$friendsAmount",
                  color: ThemeColor.brightPink,
                ),
                ThemeSizedBox.width8,
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: ThemeGradient.primary,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 16,
                    child: SvgPicture.asset(
                      ThemeIcon.coin,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
