import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/advices_article.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/modules/advices/widgets/advice_card.dart';
import 'package:lines/modules/content_library/controllers/content_library_controller.dart';

class ContentLibraryCategoryPage extends GetView<ContentLibraryController> {
  const ContentLibraryCategoryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AdvicesCategory? selectedCategory = controller.selectedCategory.value;
    List<AdvicesArticle> allArticlesForCategory = [];
    if (selectedCategory != null) {
      allArticlesForCategory.addAll(
        controller.getAllArticleForCategory(
          selectedCategory,
        ),
      );
    }

    return AppScaffoldPage(
      backgroundColor: Colors.white,
      appBar: TransparentAppBar(
        backButtonColor: ThemeColor.darkBlue,
        title: TitleMedium(
          selectedCategory?.categoryTitle?.toUpperCase() ?? "",
          color: ThemeColor.darkBlue,
          fontWeight: NewThemeTextStyle.weightSemibold,
        ),
      ),
      body: selectedCategory != null
          ? GridView.builder(
              padding: const EdgeInsets.all(16),
              scrollDirection: Axis.vertical,
              itemCount: allArticlesForCategory.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.67,
              ),
              itemBuilder: (context, index) {
                return AdviceCard(
                  onCardTap: controller.showArticleDetails,
                  article: allArticlesForCategory[index],
                );
              },
            )
          : const SizedBox.shrink(),
    );
  }
}
