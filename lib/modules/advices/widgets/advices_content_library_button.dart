import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lines/core/app_theme.dart';

class AdvicesContentLibraryButton extends StatelessWidget {
  const AdvicesContentLibraryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO : add on tap
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(60),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleLarge(
                'LIBRERIA CONTENUTI',
              ).applyShaders(context),
              SvgPicture.asset(
                ThemeIcon.arrowRightGradient,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
