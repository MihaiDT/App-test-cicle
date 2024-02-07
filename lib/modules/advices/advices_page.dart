import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/data/models/advices_article.dart';
import 'package:lines/modules/advices/widgets/advices_cards_row.dart';
import 'package:lines/modules/advices/widgets/advices_content_library_button.dart';
import 'package:lines/modules/advices/widgets/advices_gynecologist_box.dart';

import '../../core/app_theme.dart';
import '../../widgets/appbar/transparent_app_bar.dart';
import 'advices_controller.dart';

class AdvicesPage extends GetView<AdvicesController> {
  const AdvicesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransparentAppBar(
          title: const DisplayLarge(
            'Consigli',
            color: ThemeColor.primary,
          ),
          leading: InkWell(
            onTap: () {
              //TODO: add on tap
            },
            child: Center(
              child: SizedBox(
                height: 24,
                width: 24,
                child: SvgPicture.asset(
                  ThemeIcon.menu,
                  color: ThemeColor.darkBlue,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(
              bottom: 200,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: const DisplayMedium(
                    'Contenuti per te',
                  ).applyShaders(context),
                ),
              ),
              ThemeSizedBox.height16,
              SizedBox(
                height: 220,
                child: AdvicesCardsRow(
                  withBorder: true,
                  articles: [
                    AdvicesArticle.textType(
                      articleCategoryId: '',
                      id: 2,
                      typology: ArticleType.text,
                      title: 'Questo è un titolo',
                      disclaimer: '',
                      iconName: 'alimentazione.svg',
                      coverImageUrl: '',
                      shortDescription: '',
                      text: 'Questo è un testo',
                      thumbImageUrl: '',
                    ),
                    AdvicesArticle.textType(
                      articleCategoryId: '',
                      id: 2,
                      typology: ArticleType.text,
                      title: 'Questo è un titolo',
                      disclaimer: '',
                      iconName: 'alimentazione.svg',
                      coverImageUrl: '',
                      shortDescription: '',
                      text: 'Questo è un testo',
                      thumbImageUrl: '',
                    ),
                    AdvicesArticle.textType(
                      articleCategoryId: '',
                      id: 2,
                      typology: ArticleType.text,
                      title: 'Questo è un titolo',
                      disclaimer: '',
                      iconName: 'alimentazione.svg',
                      coverImageUrl: '',
                      shortDescription: '',
                      text: 'Questo è un testo',
                      thumbImageUrl: '',
                    ),
                    AdvicesArticle.textType(
                      articleCategoryId: '',
                      id: 2,
                      typology: ArticleType.text,
                      title: 'Questo è un titolo',
                      disclaimer: '',
                      iconName: 'alimentazione.svg',
                      coverImageUrl: '',
                      shortDescription: '',
                      text: 'Questo è un testo',
                      thumbImageUrl: '',
                    ),
                    AdvicesArticle.textType(
                      articleCategoryId: '',
                      id: 2,
                      typology: ArticleType.text,
                      title: 'Questo è un titolo',
                      disclaimer: '',
                      iconName: 'alimentazione.svg',
                      coverImageUrl: '',
                      shortDescription: '',
                      text: 'Questo è un testo',
                      thumbImageUrl: '',
                    ),
                    AdvicesArticle.textType(
                      articleCategoryId: '',
                      id: 2,
                      typology: ArticleType.text,
                      title: 'Questo è un titolo',
                      disclaimer: '',
                      iconName: 'alimentazione.svg',
                      coverImageUrl: '',
                      shortDescription: '',
                      text: 'Questo è un testo',
                      thumbImageUrl: '',
                    ),
                    AdvicesArticle.textType(
                      articleCategoryId: '',
                      id: 2,
                      typology: ArticleType.text,
                      title: 'Questo è un titolo',
                      disclaimer: '',
                      iconName: 'alimentazione.svg',
                      coverImageUrl: '',
                      shortDescription: '',
                      text: 'Questo è un testo',
                      thumbImageUrl: '',
                    ),
                  ],
                ),
              ),
              ThemeSizedBox.height8,
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: AdvicesContentLibraryButton(),
              ),
              ThemeSizedBox.height40,
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: AdvicesGynecologistBox(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
