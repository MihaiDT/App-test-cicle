// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/content_library/controllers/content_library_search_page_controller.dart';
import 'package:lines/modules/advices/widgets/advice_card.dart';

class ContentLibrarySearchPageResults
    extends GetView<ContentLibrarySearchPageController> {
  const ContentLibrarySearchPageResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.rxResultsArticles.value.isNotEmpty
          ? GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.rxResultsArticles.value.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.67,
              ),
              itemBuilder: (context, index) {
                return AdviceCard(
                  onCardTap: controller.showArticleDetails,
                  article: controller.rxResultsArticles.value[index],
                );
              },
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BodyMedium(
                  'Nessun risultato per la ricerca: ',
                  color: ThemeColor.darkBlue,
                ),
                TitleLarge(
                  '"${controller.text}"',
                  color: ThemeColor.darkBlue,
                ),
              ],
            ),
    );
  }
}
