import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/profile/widgets/my_badges_section.dart';
import 'package:lines/modules/profile/widgets/my_menses_section.dart';
import 'package:lines/modules/profile/widgets/profile_app_bar.dart';
import 'package:lines/modules/profile/widgets/profile_completition_percentage_section.dart';
import 'package:lines/modules/profile/widgets/profile_header.dart';
import 'package:lines/modules/profile/widgets/your_diary_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
        ),
        children: [
          const ProfileAppBar(),
          ThemeSizedBox.height12,
          const ProfileHeader(),
          ThemeSizedBox.height24,
          const ProfileCompletionPercentageSection(),
          ThemeSizedBox.height16,
          const MyMensesSection(),
          ThemeSizedBox.height16,
          const YourDiarySection(),
          ThemeSizedBox.height16,
          const MyBadgesSection(),
          const SizedBox(
            height: 200,
          ),
        ],
      ),
    );
  }
}
