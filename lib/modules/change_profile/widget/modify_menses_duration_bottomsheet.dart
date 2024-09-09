import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/theme/theme_color.dart';
import 'package:lines/data/enums/background_type.dart';
import 'package:lines/modules/how_long_menses/widget/menses_duration_counter_widget.dart';
import 'package:lines/widgets/buttons/primary_loading_button.dart';
import 'package:lines/widgets/buttons/secondary_loading_button.dart';

class ModifyMensesDurationBottomsheet extends StatefulWidget {
  final bool isButtonLoading;
  final Function(int mensessDuration) onSave;

  const ModifyMensesDurationBottomsheet({
    required this.isButtonLoading,
    required this.onSave,
    super.key,
  });

  @override
  State<ModifyMensesDurationBottomsheet> createState() =>
      _ModifyMensesDurationBottomsheetState();
}

class _ModifyMensesDurationBottomsheetState
    extends State<ModifyMensesDurationBottomsheet> {
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
            "Aggiorna la durata delle tue mestruazioni",
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
            color: ThemeColor.darkBlue,
          ),
          ThemeSizedBox.height16,
          MensesDurationCounterWidget(
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
