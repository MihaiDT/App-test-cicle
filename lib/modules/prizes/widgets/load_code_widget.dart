import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';

class LoadCodeWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const LoadCodeWidget({
    this.onTap,
    super.key,
  });

  static const Color _borderColor = Color(0xfff5f0f8);
  static const double _borderRadius = 20.0;
  static const double _externalContainerPadding = 4.0;
  static const double _externalCircleRadius = 50.0;
  static const double _externalCirclePadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 50,
            ),
            child: Container(
              padding: const EdgeInsets.all(
                _externalContainerPadding,
              ),
              decoration: BoxDecoration(
                color: _borderColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(_borderRadius),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 7),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      _borderRadius - _externalContainerPadding,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          _borderRadius - _externalContainerPadding,
                        ),
                      ),
                      child: Image.asset(
                        ThemeImage.loadCode,
                        fit: BoxFit.scaleDown,
                        width: 74,
                      ),
                    ),
                    ThemeSizedBox.width16,
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TitleMedium(
                          "CARICA CODICE",
                          color: ThemeColor.brightPink,
                        ),
                        BodySmall(
                          'Presente in tutti i pack',
                          color: ThemeColor.darkBlue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(10, 7),
                  blurRadius: 12,
                ),
              ],
            ),
            child: CircleAvatar(
              backgroundColor: _borderColor,
              radius: _externalCircleRadius,
              child: Padding(
                padding: const EdgeInsets.all(
                  _externalCirclePadding,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: _externalCircleRadius - _externalCirclePadding,
                  child: SvgPicture.asset(
                    ThemeIcon.plusGradient,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
