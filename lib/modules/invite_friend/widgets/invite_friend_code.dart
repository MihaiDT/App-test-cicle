import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/texts/notification_overlay.dart';

class InviteFriendCode extends StatelessWidget {
  final String code;

  const InviteFriendCode({
    required this.code,
    super.key,
  });

  static const Color _bgColor = Color(0xfff3eef4);
  static const Color _borderColor = Color(0xffe5e1ef);
  static const double _borderRadius = 20.0;
  static const double _borderPadding = 4.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Clipboard.setData(
          ClipboardData(text: code),
        );

        FlushBar(
          child: const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: HeadlineSmall(
              "Testo copiato correttamente!",
              color: ThemeColor.darkBlue,
            ),
          ),
        ).show(context);
      },
      child: Container(
        padding: const EdgeInsets.all(
          _borderPadding,
        ),
        decoration: const BoxDecoration(
          color: _bgColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              _borderRadius,
            ),
          ),
        ),
        child: DottedBorder(
          strokeWidth: 1.5,
          dashPattern: const [6, 6],
          borderType: BorderType.RRect,
          radius: const Radius.circular(
            _borderRadius - _borderPadding,
          ),
          color: _borderColor,
          padding: const EdgeInsets.symmetric(
            horizontal: ThemeSize.paddingMedium,
            vertical: ThemeSize.paddingSmall,
          ),
          child: Center(
            child: Text(
              code,
              style: const TextStyle(
                color: ThemeColor.primary,
                fontSize: 30,
                letterSpacing: 4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
