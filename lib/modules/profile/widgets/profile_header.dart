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
      children: [
        Container(
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
              child: Image.asset(
                ThemeImage.mockAvatar,
                fit: BoxFit.cover,
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
