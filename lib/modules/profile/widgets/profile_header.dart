import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/profile/controllers/profile_header_controller.dart';
import 'package:lines/routes/routes.dart';

class ProfileHeader extends GetView<ProfileHeaderController> {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              ThemeImage.mockAvatar,
              fit: BoxFit.cover,
            ),
          ),
        ),
        ThemeSizedBox.width32,
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.changeProfilePage);
          },
          child: Column(
            children: [
              DisplayMedium(
                controller.userName,
                color: ThemeColor.primary,
              ),
              ThemeSizedBox.height4,
              const BodyMedium(
                "MODIFICA PROFILO",
                underline: true,
              ).applyShaders(context),
            ],
          ),
        ),
      ],
    );
  }
}
