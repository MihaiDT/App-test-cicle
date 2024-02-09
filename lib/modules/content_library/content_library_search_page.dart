import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/modules/content_library/widgets/article_category_widget.dart';

import '../../core/app_theme.dart';

import '../../data/models/advices_sub_category.dart';
import 'content_library_search_page_controller.dart';
import 'content_library_search_page_results.dart';

class ContentLibrarySearchPage
    extends GetView<ContentLibrarySearchPageController> {
  const ContentLibrarySearchPage({
    super.key,
  });

  static const Color textFieldBorderColor = Color(0xffe6e0ef);
  static const Color textFieldFillColor = Color(0xfff7f3f8);
  static Color placeHolderColor = const Color(0x1e2d4f80).withOpacity(0.5);
  static Color dividerColor = const Color(0x194b399c);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  ThemeSizedBox.height12,
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: const BoxDecoration(
                            color: textFieldBorderColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: TextField(
                            readOnly: true,
                            controller: controller.textEditingController,
                            enableSuggestions: false,
                            style: NewThemeTextStyle.bodyMedium.copyWith(
                              color: ThemeColor.darkBlue,
                            ),
                            cursorColor: ThemeColor.darkBlue,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              suffix: InkWell(
                                onTap: () {
                                  controller.onTextFieldClearTapped();
                                },
                                child: SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      ThemeIcon.close,
                                      color: ThemeColor.darkBlue,
                                      height: 10,
                                      width: 10,
                                    ),
                                  ),
                                ),
                              ),
                              isDense: true,
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              filled: true,
                              fillColor: textFieldFillColor,
                              hintText: 'Cerca tra i contenuti',
                              hintStyle: NewThemeTextStyle.bodyMedium.copyWith(
                                color: placeHolderColor,
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 14,
                                ),
                                child: SvgPicture.asset(
                                  ThemeIcon.search,
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    11,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ThemeSizedBox.width16,
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const BodyMedium(
                          'Annulla',
                          color: ThemeColor.darkBlue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Obx(
                () {
                  if (controller.pageShouldRefresh) {
                    if (controller.showResults) {
                      return const Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Expanded(
                            child: ContentLibrarySearchPageResults(),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          Expanded(
                            child: ListView.builder(
                              // itemCount: AdvicesCategory.values.length,
                              itemCount: controller.categories.length,
                              itemBuilder: (context, categoryIndex) {
                                String categoryIconName = controller
                                    .categories[categoryIndex].iconName;
                                List<AdvicesSubCategory>? subCatories =
                                    controller.subCategoriesForCategory(
                                  categoryIconName,
                                );
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 14,
                                          backgroundColor: controller
                                              .categories[categoryIndex]
                                              .categoryColor,
                                          child: SvgPicture.asset(
                                            controller.categories[categoryIndex]
                                                .iconPath,
                                            color: Colors.white,
                                          ),
                                        ),
                                        ThemeSizedBox.width6,
                                        HeadlineLarge(
                                          controller.categories[categoryIndex]
                                                      .categoryTitle !=
                                                  null
                                              ? controller
                                                      .categories[categoryIndex]
                                                      .categoryTitle!
                                                      .capitalizeFirst ??
                                                  controller
                                                      .categories[categoryIndex]
                                                      .categoryTitle!
                                              : "",
                                          color: ThemeColor.darkBlue,
                                        )
                                      ],
                                    ),
                                    Divider(
                                      color: dividerColor,
                                    ),
                                    ListView.separated(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          controller.subCategoriesForCategory(
                                                      categoryIconName) !=
                                                  null
                                              ? controller
                                                  .subCategoriesForCategory(
                                                      categoryIconName)!
                                                  .length
                                              : 0,
                                      itemBuilder: (context, subCategoryIndex) {
                                        return InkWell(
                                          onTap: () {
                                            if (subCatories != null) {
                                              controller.onSubCategoryTapped(
                                                  subCatories[
                                                      subCategoryIndex]);
                                            }
                                          },
                                          child: ArticleCategoryWidget(
                                            articleName: controller
                                                .articleNameFromSubCategoryFromIndex(
                                              categoryIconName,
                                              subCategoryIndex,
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          Divider(
                                        color: dividerColor,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Divider(
                                          color: dividerColor,
                                        ),
                                        ThemeSizedBox.height48,
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
