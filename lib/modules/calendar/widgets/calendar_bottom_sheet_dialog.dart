import 'package:flutter/material.dart';

import '../../../core/theme/text_wrapper.dart';
import '../../../core/theme/theme_color.dart';
import '../../../core/theme/theme_icon.dart';
import '../../../core/theme/theme_sized_box.dart';
import '../../../widgets/buttons/app_round_button.dart';
import '../../../widgets/buttons/primary_button.dart';

class CalendarBottomSheetDialog extends StatefulWidget {
  final Map<int, dynamic> filteredMap;
  final Function(Map<int, dynamic>) onConfirmTap;
  final VoidCallback onCancelTap;

  const CalendarBottomSheetDialog({
    super.key,
    required this.filteredMap,
    required this.onConfirmTap,
    required this.onCancelTap,
  });

  @override
  State<CalendarBottomSheetDialog> createState() =>
      _CalendarBottomSheetDialogState();
}

class _CalendarBottomSheetDialogState extends State<CalendarBottomSheetDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ThemeSizedBox.height40,
            const DisplayMedium(
              'Puoi selezionare al massimo tre topic',
              textAlign: TextAlign.center,
            ).applyShaders(context),
            ThemeSizedBox.height16,
            const BodyMedium(
              'Scegli quali visualizzare nella home',
              color: ThemeColor.darkBlue,
            ),
            ThemeSizedBox.height24,
            Column(
              children: [
                const Divider(),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    List<int> keys = widget.filteredMap.keys.toList();
                    return _row(widget.filteredMap, keys[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: widget.filteredMap.keys.length,
                ),
                const Divider(),
              ],
            ),
            ThemeSizedBox.height36,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: InkWell(
                    onTap: () {
                      widget.onCancelTap();
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: const TitleLarge('ANNULLA').applyShaders(context),
                    ),
                  ),
                ),
                Expanded(
                  child: PrimaryButton(
                    text: 'CONFERMA',
                    fullWidth: false,
                    small: false,
                    onPressed: () {
                      widget.onConfirmTap(widget.filteredMap);
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
            ThemeSizedBox.height20
          ],
        ),
      ),
    );
  }

  Widget _row(Map<int, dynamic> filteredMap, int index) {
    return Row(
      children: [
        AppRoundButton(
            radius: 13,
            iconPath: ThemeIcon.checkMark,
            onChanged: (value) {
              //this piece of code will take care of selected non more then 3 categories inside the dialog

              int trueCount = 0;
              if (filteredMap[index]['inHome'] == false) {
                for (int key in filteredMap.keys) {
                  if (filteredMap[key]['inHome'] == true) {
                    trueCount++;
                  }
                }
                if (trueCount <= 2) {
                  filteredMap[index]['inHome'] = true;
                }
              } else {
                filteredMap[index]['inHome'] = false;
              }
              setState(() {});
            },
            value: filteredMap[index]['inHome']),
        ThemeSizedBox.width12,
        HeadlineSmall(
          filteredMap[index]['title'],
          color: ThemeColor.darkBlue,
        )
      ],
    );
  }
}
