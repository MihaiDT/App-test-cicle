import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/enums/background_type.dart';
import 'package:lines/modules/how_long_menses/widget/how_often_menses_widget.dart';
import 'package:lines/widgets/buttons/primary_loading_button.dart';
import 'package:lines/widgets/buttons/secondary_loading_button.dart';

class HowOftenMensesDurationBottomsheet extends StatefulWidget {
  final bool isButtonLoading;
  final Function(int mensessDuration) onSave;

  const HowOftenMensesDurationBottomsheet({
    required this.isButtonLoading,
    required this.onSave,
    super.key,
  });

  @override
  State<HowOftenMensesDurationBottomsheet> createState() =>
      _HowOftenMensesDurationBottomsheetState();
}

class _HowOftenMensesDurationBottomsheetState
    extends State<HowOftenMensesDurationBottomsheet> {
  int mensesDuration = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          ThemeSizedBox.height24,
          const DisplaySmall(
            "Aggiorna ogni quanti giorni\n ti arrivano le mestruazioni?",
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
            color: ThemeColor.darkBlue,
          ),
          ThemeSizedBox.height24,
          HowOftenMensesWidget(
            backgroundType: BackgroundType.light,
            onTap: (value) {
              setState(() {
                mensesDuration = value;
              });
            },
          ),
          ThemeSizedBox.height16,
          PrimaryLoadingButton(
            isLoading: widget.isButtonLoading,
            onPressed: () {
              widget.onSave(mensesDuration);
            },
            child: const TitleLarge(
              "Salva",
            ),
          ),
          ThemeSizedBox.height24,
        ],
      ),
    );
  }
}
