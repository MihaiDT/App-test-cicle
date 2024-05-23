import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/change_profile/controller/your_information_section_controller.dart';
import 'package:lines/modules/change_profile/widget/information_tile.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/parameters_class/update_user_parameters.dart';

class YourInformationSection extends GetView<YourInformationSectionController> {
  const YourInformationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: ThemeSize.paddingSmall,
            ),
            child: const DisplayMedium(
              "I tuoi dati",
            ).applyShaders(context),
          ),
          ThemeSizedBox.height16,
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InformationTile(
                title: "Nome",
                value: controller.user?.firstName ?? '',
                onTap: () {
                  controller.updateName(
                    title: "Modifica Nome",
                    onConfirm: (name) async {
                      await AuthenticationService.updateUser(
                        UpdateUserParameters(
                          firstName: name,
                        ),
                      ).then((value) {
                        Navigator.pop(context);
                      });
                    },
                    initialText: controller.user?.firstName ?? '',
                  );
                },
              ),
              ThemeSizedBox.height8,
              InformationTile(
                title: "Nickname",
                value: controller.user?.nickname?.isNotEmpty == true
                    ? controller.user?.nickname ?? 'Nessuno'
                    : 'Nessuno',
                onTap: () => controller.updateNickname(
                  title: "Modifica Nickname",
                  onConfirm: (nickname) async {
                    await AuthenticationService.updateUser(
                      UpdateUserParameters(
                        nickname: nickname,
                      ),
                    ).then((value) {
                      Navigator.pop(context);
                    });
                  },
                  initialText: controller.user?.nickname ?? 'Nessuno',
                ),
              ),
              ThemeSizedBox.height8,
              InformationTile(
                title: "Cognome",
                value: controller.user?.lastName ?? '',
                onTap: () => controller.updateLastName(
                  title: "Modifica Cognome",
                  onConfirm: (lastName) async {
                    await AuthenticationService.updateUser(
                      UpdateUserParameters(
                        lastName: lastName,
                      ),
                    ).then((value) {
                      Navigator.pop(context);
                    });
                  },
                  initialText: controller.user?.lastName ?? '',
                ),
              ),
              ThemeSizedBox.height8,
              InformationTile(
                title: "Data di nascita",
                value: controller.user?.formattedDateWithPipes ?? '',
              ),
              ThemeSizedBox.height8,
              InformationTile(
                title: "CAP",
                value: controller.user?.zipCode ?? '',
                percentageValue: controller.isZipCodeCompleted ? null : '10%',
                onTap: () => controller.updateZipCode(
                  title: "Modifica CAP",
                  onConfirm: (zipCode) async {
                    await AuthenticationService.updateUser(
                      UpdateUserParameters(
                        zipCode: zipCode,
                      ),
                    ).then((value) {
                      Navigator.pop(context);
                    });
                  },
                  initialText: controller.user?.zipCode ?? '',
                ),
              ),
              ThemeSizedBox.height8,
            ],
          ),
        ],
      );
    });
  }
}
