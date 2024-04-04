import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/new_symptom_category.dart';
import 'package:lines/widgets/buttons/primary_button.dart';

class TooMuchCategoriesDialog extends StatefulWidget {
  final List<NewSymptomCategory> initialList;
  final Function(List<NewSymptomCategory>) onConfirmTap;
  final VoidCallback onCancelTap;

  const TooMuchCategoriesDialog({
    super.key,
    required this.initialList,
    required this.onConfirmTap,
    required this.onCancelTap,
  });

  @override
  State<TooMuchCategoriesDialog> createState() =>
      _TooMuchCategoriesDialogState();
}

class _TooMuchCategoriesDialogState extends State<TooMuchCategoriesDialog> {
  final List<NewSymptomCategory> filteredList = [];

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
            const Divider(),
            ListView.separated(
              shrinkWrap: true,
              itemCount: widget.initialList.length,
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          updateFilteredList(widget.initialList[index]);
                        });
                      },
                      child: SvgPicture.asset(
                        isCategorySelected(widget.initialList[index])
                            ? ThemeIcon.checkboxFilled
                            : ThemeIcon.checkboxOutline,
                        height: 26,
                        width: 26,
                      ),
                    ),
                    ThemeSizedBox.width12,
                    HeadlineSmall(
                      widget.initialList[index].name,
                      color: ThemeColor.primary,
                    ),
                  ],
                );
              },
            ),
            const Divider(),
            ThemeSizedBox.height36,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: GestureDetector(
                    onTap: () {
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
                    onPressed: () {
                      widget.onConfirmTap(filteredList);
                      Navigator.pop(context);
                    },
                    child: const TitleLarge('CONFERMA'),
                  ),
                ),
              ],
            ),
            ThemeSizedBox.height20,
          ],
        ),
      ),
    );
  }

  bool isCategorySelected(NewSymptomCategory category) {
    return filteredList.contains(category);
  }

  void updateFilteredList(NewSymptomCategory category) {
    if (filteredList.contains(category)) {
      filteredList.remove(category);
    } else {
      if (filteredList.length >= 3) {
        return;
      }
      filteredList.add(category);
    }
  }
}
