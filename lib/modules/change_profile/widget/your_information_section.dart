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
                    onConfirm: (name) {
                      AuthenticationService.updateUser(
                        UpdateUserParameters(
                          firstName: name,
                        ),
                      );
                    },
                    initialText: controller.user?.firstName ?? '',
                  );
                },
              ),
              ThemeSizedBox.height8,
              InformationTile(
                title: "Nickname",
                value: controller.user?.nickname ?? 'Nessuno',
                onTap: () => controller.updateNickname(
                  title: "Modifica Nickname",
                  onConfirm: (nickname) {
                    AuthenticationService.updateUser(
                      UpdateUserParameters(
                        nickname: nickname,
                      ),
                    );
                  },
                  initialText: controller.user?.nickname ?? '',
                ),
              ),
              ThemeSizedBox.height8,
              InformationTile(
                title: "Cognome",
                value: controller.user?.lastName ?? '',
                onTap: () => controller.updateLastName(
                  title: "Modifica Cognome",
                  onConfirm: (lastName) {
                    AuthenticationService.updateUser(
                      UpdateUserParameters(
                        lastName: lastName,
                      ),
                    );
                  },
                  initialText: controller.user?.lastName ?? '',
                ),
              ),
              ThemeSizedBox.height8,
              InformationTile(
                title: "Data di nascita",
                value: controller.user?.birthdate ?? '',
              ),
              ThemeSizedBox.height8,
              InformationTile(
                title: "CAP",
                value: 'inserisci',
                percentageValue: '10%',
                onTap: () => controller.updateZipCode(
                  title: "Modifica Cognome",
                  onConfirm: (lastName) {
                    AuthenticationService.updateUser(
                      UpdateUserParameters(
                        zipCode: lastName,
                      ),
                    );
                  },
                  initialText: controller.user?.lastName ?? '',
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
