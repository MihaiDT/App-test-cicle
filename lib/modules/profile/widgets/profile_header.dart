import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/secure_storage_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/profile/controllers/profile_header_controller.dart';
import 'package:lines/routes/routes.dart';

class ProfileHeader extends GetView<ProfileHeaderController> {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 4,
        ),
        InkWell(
          onTap: () async {
            final sessionToken = await SecureStorageManager().getToken();
            Get.toNamed(
              Routes.customizeCherryWebView,
              arguments: {
                'sessionToken': sessionToken,
              },
            );
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff9160D7).withOpacity(0.2),
                  offset: const Offset(10, 10), // Updated shadow position
                  blurRadius: 21, // Updated shadow blur
                  spreadRadius: 4, // Updated shadow spread
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white.withOpacity(0.7),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: _avatar(),
              ),
            ),
          ),
        ),
        ThemeSizedBox.width32,
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.changeProfilePage);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DisplayMedium(
                "Ciao ${controller.userName}",
                color: ThemeColor.primary,
              ),
              ThemeSizedBox.height4,
              const TitleMedium(
                "MODIFICA PROFILO",
                underline: true,
                letterSpacing: 1.5,
              ).applyShaders(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _avatar() {
    return Obx(
      () => appController.user.responseHandler.isSuccessful
          ? SizedBox(
              width: 160,
              height: 160,
              child: appController.user.value!.isAvatarConfigured
                  ? Image.network(
                      appController.user.value!.avatarPhase0ImgUrl ?? '',
                      fit: BoxFit.scaleDown,
                    )
                  : Image.asset(
                      ThemeImage.mockAvatar,
                      fit: BoxFit.scaleDown,
                    ),
            )
          : const SizedBox.shrink(),
    );
  }
}
