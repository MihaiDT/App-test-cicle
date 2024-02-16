import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/data/models/walkthrough_data.dart';
import 'package:lines/widgets/walkthrough/controller/walkthrough_controller.dart';
import 'package:lines/widgets/walkthrough/walkthrough_body.dart';
import 'package:lines/widgets/walkthrough/walkthrough_bottom.dart';

class Walkthrough extends StatelessWidget {
  final WalkthroughController _controller = Get.put(WalkthroughController());
  final List<WalkthroughData> pagesData;
  final VoidCallback? onTapLetsStart;

  Walkthrough({
    required this.pagesData,
    this.onTapLetsStart,
    super.key,
  });

  int get numberOfPages => pagesData.length;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
            pagesData.length,
            (index) => WalkthroughBody(
              data: pagesData[index],
            ),
          ),
        ),
        WalkthroughBottom(
          numberOfPages: numberOfPages,
          onTapLetsStart: onTapLetsStart,
        )
      ],
    );
  }
}
