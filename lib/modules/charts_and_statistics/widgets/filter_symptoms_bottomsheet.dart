import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/symptom.dart';

class FilterSymptomsBottomSheet extends StatelessWidget {
  final List<Symptom> symptoms;
  final Symptom? selectedSymptom;

  const FilterSymptomsBottomSheet({
    required this.symptoms,
    this.selectedSymptom,
    super.key,
  });

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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              ThemeSizedBox.height16,
              const HeadlineSmall(
                "SELEZIONA SINTOMO",
                color: ThemeColor.primary,
                textAlign: TextAlign.center,
              ),
              ThemeSizedBox.height32,
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Divider(),
                  ListTile(
                    title: const HeadlineSmall(
                      "Tutti",
                      color: ThemeColor.darkBlue,
                    ),
                    onTap: () {
                      Navigator.pop(context, null);
                    },
                    trailing: selectedSymptom?.id == null
                        ? const Icon(
                            Icons.check,
                            color: ThemeColor.darkBlue,
                          )
                        : null,
                    contentPadding: EdgeInsets.zero,
                  ),
                ],
              ),
              ...List.generate(
                symptoms.length,
                (index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Divider(),
                      ListTile(
                        leading: SvgPicture.asset(
                          "${symptoms[index].iconPath}/${symptoms[index].code}.svg",
                          height: 24,
                          fit: BoxFit.scaleDown,
                          width: 24,
                        ),
                        title: HeadlineSmall(
                          symptoms[index].name,
                          color: ThemeColor.darkBlue,
                        ),
                        onTap: () {
                          Navigator.pop(context, symptoms[index]);
                        },
                        trailing: selectedSymptom?.id == symptoms[index].id
                            ? const Icon(
                                Icons.check,
                                color: ThemeColor.darkBlue,
                              )
                            : null,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ],
                  );
                },
              ),
              const Divider(),
              ThemeSizedBox.height32,
            ],
          ),
        ),
      ),
    );
  }
}
