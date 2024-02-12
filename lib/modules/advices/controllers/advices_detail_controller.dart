import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lines/data/models/advices_article.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/modules/advices/controllers/advices_detail_store.dart';
import 'package:video_player/video_player.dart';

class AdvicesDetailController extends GetxController {
  AdvicesDetailStore advicesDetailStore = Get.put(
    AdvicesDetailStore(),
  );
  final ScrollController scrollController = ScrollController();
  late final VideoPlayerController videoPlayerController;

  AdvicesArticle? get article => advicesDetailStore.articleDetail?.article;

  AdvicesCategory? get category => advicesDetailStore.articleDetail?.category;

  RxDouble proportion = 0.0.obs;
  RxInt currentSlide = 0.obs;
  Rx<Duration> duration = Rx<Duration>(Duration.zero);
  RxBool hasStarted = false.obs;
  RxBool videoIsInitialized = false.obs;
  RxBool isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (article?.typology == ArticleType.text) {
      _initTextDetail();
    }
    if (article?.typology == ArticleType.video) {
      _initVideoDetail();
    }
  }

  void _initTextDetail() {
    scrollController.addListener(
      () {
        proportion.value = scrollController.offset /
            scrollController.position.viewportDimension;
      },
    );
  }

  void _initVideoDetail() {
    if (article?.videoUrl?.isNotEmpty == true) {
      videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(article!.videoUrl!),
      )..initialize().then(
          (_) {
            videoIsInitialized.value = true;
            duration.value = videoPlayerController.value.duration;
          },
        );
    }
    videoPlayerController.addListener(
      () {
        if (videoPlayerController.value.isPlaying) {
          duration.value = videoPlayerController.value.duration -
              videoPlayerController.value.position;
          isPlaying.value = true;
        } else {
          isPlaying.value = false;
        }
        if (videoPlayerController.value.position ==
            videoPlayerController.value.duration) {
          hasStarted.value = false;
          videoPlayerController.seekTo(Duration.zero);
          duration.value = videoPlayerController.value.duration;
        }
      },
    );
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
  void onClose() {
    super.onClose();
    scrollController.dispose();
    //this condition will ensure that the article is of type video ,otherwise it will throw an error of late initialization
    if (article?.typology == ArticleType.video) {
      videoPlayerController.dispose();
    }
  }

  String durationToString(Duration duration) {
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);

    return "$minutes:${twoDigits(seconds)}";
  }

  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }
}
