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

  double get _imageSize => Get.height * 0.2;
  double get _topPadding => Get.height * 0.2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: _topPadding),
          SizedBox(height: _imageSize, width: _imageSize, child: data.image),
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
