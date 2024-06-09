import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/advices_article.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/modules/advices/widgets/suggested_article_section.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:share_plus/share_plus.dart';

class AdvicesTextArticleDetails extends StatelessWidget {
  final AdvicesCategory? category;

  final AdvicesArticle? article;

  final bool isArticleFav;

  final Function(bool isFav) onFavChanged;

  final String id;
  final List<AdvicesArticle> allSuggestedArticles;

  const AdvicesTextArticleDetails({
    required this.category,
    required this.article,
    required this.isArticleFav,
    required this.onFavChanged,
    required this.id,
    required this.allSuggestedArticles,
    super.key,
  });

  static const Color _dividerColor = Color(0x194b399c);
  static const Color _disclaimerColor = Color(0x7f1f2d4f);

  @override
  Widget build(BuildContext context) {
    RxDouble proportion = 0.0.obs;
    final ScrollController scrollController = ScrollController();
    _initTextDetail(scrollController, proportion);
    return AppScaffoldPage(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          _appBar(context, proportion),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ThemeSize.paddingMedium,
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
                        article?.title ?? "",
                        textAlign: TextAlign.center,
                      ).applyShaders(context),
                      ThemeSizedBox.height16,
                      BodyLarge(
                        article?.shortDescription ?? "",
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
                        data: article?.text,
                        style: {
                          "span": Style(
                            color: ThemeColor.darkBlue,
                            fontSize: FontSize(16),
                            fontWeight: FontWeight.w600,
                          ),
                          "body": Style(
                            color: ThemeColor.darkBlue,
                            fontSize: FontSize(14),
                            fontWeight: FontWeight.w400,
                          ),
                          "a": Style(
                            color: ThemeColor.darkBlue,
                            fontSize: FontSize(14),
                            fontWeight: FontWeight.w400,
                          ),
                        },
                      ),
                      ThemeSizedBox.height32,
                      LabelLarge(
                        "Questo contenuto è stato scritto da esperti del settore e fornisce solo informazioni di carattere generale. Per ogni dubbio, chiarimento o approfondimento consulta sempre il tuo medico.",
                        color: _disclaimerColor.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                      ),
                      ThemeSizedBox.height60,
                    ],
                  ),
                ),
                SuggestedArticleSection(
                  allSuggestedArticles: allSuggestedArticles,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBar(
    BuildContext context,
    RxDouble proportion,
  ) {
    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: category?.categoryColor,
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
              visible: article?.thumbImageUrl?.isNotEmpty == true,
              child: AnimatedOpacity(
                duration: const Duration(
                  milliseconds: 500,
                ),
                opacity: proportion.value <= 0.40 ? 1.0 : 0.0,
                child: Image.network(
                  article!.thumbImageUrl!,
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
                        'https://lines-test-link.s3.amazonaws.com/articles/${article?.id}',
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
                      onFavChanged(!isArticleFav);
                    },
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: isArticleFav
                          ? SvgPicture.asset(
                              ThemeIcon.savedFilled,
                              color: ThemeColor.darkBlue,
                            )
                          : SvgPicture.asset(
                              ThemeIcon.savedEmptyGradient,
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

  void _initTextDetail(ScrollController scrollController, RxDouble proportion) {
    scrollController.addListener(
      () {
        proportion.value = scrollController.offset /
            scrollController.position.viewportDimension;
      },
    );
  }
}
