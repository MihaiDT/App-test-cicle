import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/modules/advices/controllers/advices_detail_controller.dart';
import 'package:lines/modules/advices/widgets/suggested_article_section.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:share_plus/share_plus.dart';

class AdvicesTextArticleDetails extends GetView<AdvicesDetailController> {
  const AdvicesTextArticleDetails({
    super.key,
  });

  static const Color _dividerColor = Color(0x194b399c);
  static const Color _disclaimerColor = Color(0x7f1f2d4f);

  @override
  Widget build(BuildContext context) {
    AdvicesCategory? category = controller.category;
    return AppScaffoldPage(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          _appBar(context),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ThemeSize.paddingSmall,
                  ),
                  child: Column(
                    children: [
                      ThemeSizedBox.height32,
                      CircleAvatar(
                        backgroundColor:
                            category?.categoryColor ?? Colors.transparent,
                        child: SvgPicture.asset(
                          category?.iconPath ?? "",
                          color: Colors.white,
                        ),
                      ),
                      ThemeSizedBox.height8,
                      TitleMedium(
                        category?.categoryTitle?.toUpperCase() ?? "",
                        color: ThemeColor.darkBlue,
                        textAlign: TextAlign.center,
                      ),
                      ThemeSizedBox.height4,
                      DisplayMedium(
                        controller.article?.title ?? "",
                        textAlign: TextAlign.center,
                      ).applyShaders(context),
                      ThemeSizedBox.height16,
                      BodyLarge(
                        controller.article?.shortDescription ?? "",
                        color: ThemeColor.darkBlue,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                      ),
                      ThemeSizedBox.height48,
                      const Divider(
                        color: _dividerColor,
                      ),
                      ThemeSizedBox.height48,
                      Html(
                        data: controller.article?.text,
                      ),
                      ThemeSizedBox.height48,
                      LabelLarge(
                        controller.article?.disclaimer ?? "",
                        color: _disclaimerColor,
                        fontWeight: FontWeight.w500,
                      ),
                      ThemeSizedBox.height60,
                    ],
                  ),
                ),
                const SuggestedArticleSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: controller.category?.categoryColor,
      elevation: 0,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: SvgPicture.asset(
            ThemeIcon.back,
            color: ThemeColor.darkBlue,
          ),
        ),
      ),
      expandedHeight: 375,
      floating: false,
      pinned: true,
      snap: false,
      flexibleSpace: Stack(
        children: [
          Obx(
            () => Visibility(
              visible: controller.article?.thumbImageUrl?.isNotEmpty == true,
              child: AnimatedOpacity(
                duration: const Duration(
                  milliseconds: 500,
                ),
                opacity: controller.proportion.value <= 0.40 ? 1.0 : 0.0,
                child: Image.network(
                  controller.article!.thumbImageUrl!,
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () async {
                      await Share.share(
                        'https://lines-test-link.s3.amazonaws.com/articles/${controller.article?.id}',
                      );
                    },
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset(
                        ThemeIcon.shareGradient,
                      ),
                    ),
                  ),
                  ThemeSizedBox.width8,
                  InkWell(
                    onTap: () {
                      if (controller.isArticleFav.value) {
                        controller.removeArticleFromFav();
                      } else {
                        controller.addArticleToFav();
                      }
                    },
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Obx(
                        () {
                          if (controller.isArticleFav.value) {
                            return SvgPicture.asset(
                              ThemeIcon.savedFilled,
                              color: ThemeColor.darkBlue,
                            );
                          } else {
                            return SvgPicture.asset(
                              ThemeIcon.savedEmptyGradient,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
