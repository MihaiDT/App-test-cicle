import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/advices_article.dart';
import 'package:lines/data/models/advices_article_detail_pair.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/repository/advices_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AdvicesDetailController extends GetxController {
  late final AdvicesDetailPair? articleDetail = Get.arguments;

  final ScrollController scrollController = ScrollController();

  late final YoutubePlayerController youtubePlayerController;

  final RxBool isArticleFav = false.obs;

  late AdvicesArticle? article;

  late AdvicesCategory? category;

  RxInt currentSlide = 0.obs;
  Rx<Duration> duration = Rx<Duration>(Duration.zero);
  RxBool hasStarted = false.obs;
  RxBool videoIsInitialized = false.obs;
  RxBool isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();
    article = articleDetail?.article;
    category = articleDetail?.category;
    if (article?.typology == ArticleType.video) {
      _initVideoDetail();
    }
    isArticleFav.value = article?.isFavorite == true;
  }

  void _initVideoDetail() {
    String videoUrl = article?.videoUrl ?? "";
    if (videoUrl.isNotEmpty == true) {
      String? id = YoutubePlayer.convertUrlToId(videoUrl);

      youtubePlayerController = YoutubePlayerController(
        initialVideoId: id ?? '',
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          showLiveFullscreenButton: false,
          hideControls: true,
        ),
      );
      videoIsInitialized.value = true;
    }
  }

  void onSlideChanged(int newValue) {
    currentSlide.value = newValue;
  }

  List<Widget> get getSliderImages {
    return List.generate(
      article?.slideshowImageUrls?.length ?? 0,
      (index) => Image.network(
        article?.slideshowImageUrls?[index] ?? "",
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    youtubePlayerController.dispose();
  }

  // String durationToString(Duration duration) {
  //   int minutes = duration.inMinutes.remainder(60);
  //   int seconds = duration.inSeconds.remainder(60);

  //   return "$minutes:${twoDigits(seconds)}";
  // }

  // String twoDigits(int n) {
  //   if (n >= 10) return "$n";
  //   return "0$n";
  // }

  void _updateArticleFavStatus(bool isFav) async {
    AdvicesArticle? articleToSave = article;
    if (articleToSave != null) {
      if (isFav) {
        await AdvicesService.addArticleToFav(articleToSave);
      } else {
        await AdvicesService.removeArticleFromFav(articleToSave);
      }
      isArticleFav.value = isFav;
      await AdvicesService.fetchArticles();
    }
  }

  void updateArticleFavStatus(bool isFav) {
    _updateArticleFavStatus(isFav);
  }

  void addArticleToFav() {
    _updateArticleFavStatus(true);
  }

  void removeArticleFromFav() {
    _updateArticleFavStatus(false);
  }

  List<AdvicesArticle> get allSuggestedArticles {
    return appController.suggestedAdvicesArticle.value ?? [];
  }
}
