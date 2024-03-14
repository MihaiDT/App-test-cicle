import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/walkthrough_data.dart';

class WalkthroughBody extends StatelessWidget {
  final WalkthroughData data;

  const WalkthroughBody({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * 0.1,
          ),
          SizedBox(
            height: Get.height * 0.4,
            child: data.image,
          ),
          ThemeSizedBox.height24,
          DisplayMedium(
            data.title,
            textAlign: TextAlign.center,
          ).applyShaders(context),
          ThemeSizedBox.height16,
          BodyLarge(
            data.description,
            color: ThemeColor.darkBlue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
