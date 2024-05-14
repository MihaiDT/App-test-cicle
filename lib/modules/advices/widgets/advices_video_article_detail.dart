import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/advices/controllers/advices_detail_controller.dart';
import 'package:lines/modules/advices/widgets/suggested_article_section.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:video_player/video_player.dart';

class AdvicesVideoArticleDetail extends GetView<AdvicesDetailController> {
  const AdvicesVideoArticleDetail({
    super.key,
  });

  static Color playButtonColor = const Color(0xffc1827c);
  static const Color _disclaimerColor = Color(0x7f1f2d4f);
  static const Color _timerBgColor = Color(0xff603ba1);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      appBar: TransparentAppBar(
        actions: [
          SvgPicture.asset(
            ThemeIcon.shareGradient,
            color: ThemeColor.darkBlue,
          ),
          ThemeSizedBox.width24,
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
                      ThemeIcon.savedEmpty,
                      color: ThemeColor.darkBlue,
                    );
                  }
                },
              ),
            ),
          ),
        ],
        backButtonColor: ThemeColor.darkBlue,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Obx(
          () => controller.videoIsInitialized.value
              ? ListView(
                  children: [
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
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
                          controller.category?.categoryTitle?.toUpperCase() ??
                              "",
                          color: ThemeColor.darkBlue,
                          textAlign: TextAlign.center,
                        ),
                        ThemeSizedBox.height4,
                        DisplayMedium(
                          controller.article?.title ?? "",
                          textAlign: TextAlign.center,
                        ).applyShaders(context),
                        ThemeSizedBox.height40,
                        AspectRatio(
                          aspectRatio: controller
                              .videoPlayerController.value.aspectRatio,
                          child: Stack(
                            children: [
                              Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: VideoPlayer(
                                  controller.videoPlayerController,
                                ),
                              ),
                              Visibility(
                                visible: controller.hasStarted.value == false,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    controller.article?.videoImagePreviewUrl ??
                                        "",
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: !controller.isPlaying.value,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      10,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: _timerBgColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(90),
                                        ),
                                      ),
                                      child: BodySmall(
                                        controller.durationToString(
                                          controller.duration.value,
                                        ),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.hasStarted.value = true;
                                  if (controller
                                      .videoPlayerController.value.isPlaying) {
                                    controller.videoPlayerController.pause();
                                  } else {
                                    controller.videoPlayerController.play();
                                  }
                                },
                                child: !controller.isPlaying.value
                                    ? Center(
                                        child: CircleAvatar(
                                          radius: 28,
                                          backgroundColor: playButtonColor,
                                          child: SvgPicture.asset(
                                            ThemeIcon.play,
                                          ),
                                        ),
                                      )
                                    : const SizedBox.expand(),
                              ),
                            ],
                          ),
                        ),
                        ThemeSizedBox.height40,
                        LabelLarge(
                          controller.article?.disclaimer ?? "",
                          color: _disclaimerColor,
                          fontWeight: FontWeight.w500,
                        ),
                        ThemeSizedBox.height60,
                        const SuggestedArticleSection(),
                      ],
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
