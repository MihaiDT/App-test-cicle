import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lines/modules/content_library/widgets/content_library_category_tab_rows.dart';
import '../../../core/app_theme.dart';
import '../controllers/content_library_controller.dart';
import '../widgets/advices_categories_grid.dart';

class CategoriesTab extends GetView<ContentLibraryController> {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.pageShouldRefresh) {
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              AdvicesCategoriesGrid(
                categories: controller.getAllCategories,
                onCategoryTapped: controller.showCategoryPage,
              ),
              ThemeSizedBox.height24,
              ContentLibraryCategoryTabRows(
                onCardTapped: controller.showArticleDetails,
                allCategoriesWithArticles:
                    controller.getAllCategoriesWithArticles,
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
