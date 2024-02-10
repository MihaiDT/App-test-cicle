import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/app_theme.dart';
import '../../../widgets/appbar/transparent_app_bar.dart';
import '../../../widgets/layouts/app_scaffold_page.dart';
import '../controllers/advices_detail_controller.dart';

class AdvicesSliderArticleDetail extends GetView<AdvicesDetailController> {
  const AdvicesSliderArticleDetail({
    super.key,
  });

  static const Color _unselectedDotColor = Color(0x194b399c);
  static const Color _disclaimerColor = Color(0x7f1f2d4f);

  @override
  Widget build(BuildContext context) {
    List<Widget> images = controller.getSliderImages;
    return AppScaffoldPage(
      backgroundColor: Colors.white,
      appBar: TransparentAppBar(
        actions: [
          SvgPicture.asset(
            ThemeIcon.shareGradient,
            color: ThemeColor.darkBlue,
          ),
          ThemeSizedBox.width24,
          SvgPicture.asset(
            ThemeIcon.savedEmpty,
            color: ThemeColor.darkBlue,
          ),
        ],
        backButtonColor: ThemeColor.darkBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: ListView(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: controller.category?.categoryColor,
              child: SvgPicture.asset(
                controller.category?.iconPath ?? "",
                color: Colors.white,
              ),
            ),
            ThemeSizedBox.height8,
            TitleMedium(
              controller.category?.categoryTitle?.toUpperCase() ?? "",
              color: ThemeColor.darkBlue,
              textAlign: TextAlign.center,
            ),
            ThemeSizedBox.height4,
            DisplayMedium(
              controller.article?.title ?? "",
              textAlign: TextAlign.center,
            ).applyShaders(context),
            ThemeSizedBox.height40,
            Visibility(
              visible:
                  controller.article?.slideshowImageUrls?.isNotEmpty == true,
              child: Container(
                height: 500,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: PageView(
                  onPageChanged: (value) {
                    controller.onSlideChanged(value);
                  },
                  clipBehavior: Clip.hardEdge,
                  children: images,
                ),
              ),
            ),
            ThemeSizedBox.height16,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.asMap().entries.map(
                (entry) {
                  return Obx(
                    () => Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 4.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.currentSlide.value == entry.key
                            ? Colors.black
                            : _unselectedDotColor,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            ThemeSizedBox.height40,
            LabelLarge(
              controller.article?.disclaimer ?? "",
              color: _disclaimerColor,
              fontWeight: FontWeight.w500,
            ),
            ThemeSizedBox.height60,
          ],
        ),
      ),
    );
  }
}
