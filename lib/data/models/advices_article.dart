class AdvicesArticle {
  final String articleCategoryId;
  final int id;
  final ArticleType typology;
  final String title;
  final String? disclaimer;
  late final String? coverImageUrl;
  late final List<String>? slideshowImageUrls;
  late final String? shortDescription;
  late final String? text;
  late final String? thumbImageUrl;
  late final String? videoImagePreview;
  late final String? videoUrl;

  AdvicesArticle.textType({
    required this.articleCategoryId,
    required this.id,
    required this.typology,
    required this.title,
    required this.disclaimer,
    required this.coverImageUrl,
    required this.shortDescription,
    required this.text,
    required this.thumbImageUrl,
  }) {
    videoUrl = null;
    videoImagePreview = null;
    slideshowImageUrls = null;
  }

  AdvicesArticle.sliderType({
    required this.articleCategoryId,
    required this.id,
    required this.typology,
    required this.title,
    required this.disclaimer,
    required this.coverImageUrl,
    required this.thumbImageUrl,
    required this.slideshowImageUrls,
  }) {
    videoUrl = null;
    videoImagePreview = null;
    text = null;
    shortDescription = null;
  }

  AdvicesArticle.videoType({
    required this.articleCategoryId,
    required this.id,
    required this.typology,
    required this.title,
    required this.disclaimer,
    required this.thumbImageUrl,
    required this.videoImagePreview,
    required this.videoUrl,
  }) {
    text = null;
    shortDescription = null;
    slideshowImageUrls = null;
    coverImageUrl = null;
  }

  factory AdvicesArticle.fromJson(Map<String, dynamic> data) {
    ArticleType articleType = ArticleType.fromString(data['typology']);
    switch (articleType) {
      case ArticleType.text:
        return AdvicesArticle.textType(
          articleCategoryId: data['article_category_id'],
          id: data['id'],
          typology: articleType,
          title: data['title'],
          disclaimer: data['disclaimer'],
          coverImageUrl: data['cover_image_ur'],
          shortDescription: data['short_description'],
          text: data['text'],
          thumbImageUrl: data['thumb_image_url'],
        );
      case ArticleType.slider:
        return AdvicesArticle.sliderType(
          articleCategoryId: data['article_category_id'],
          id: data['id'],
          typology: articleType,
          title: data['title'],
          disclaimer: data['disclaimer'],
          coverImageUrl: data['cover_image_ur'],
          thumbImageUrl: data['thumb_image_url'],
          slideshowImageUrls: List<String>.from(data['slideshow_image_urls']),
        );
      case ArticleType.video:
        return AdvicesArticle.videoType(
          articleCategoryId: data['article_category_id'],
          id: data['id'],
          typology: articleType,
          title: data['title'],
          disclaimer: data['disclaimer'],
          thumbImageUrl: data['thumb_image_url'],
          videoImagePreview: data['video_image_preview'],
          videoUrl: data['video_url'],
        );
    }
  }
}

enum ArticleType {
  text,
  slider,
  video;

  static ArticleType fromString(String type) {
    switch (type) {
      case 'text':
        return ArticleType.text;
      case 'slider':
        return ArticleType.slider;
      case 'video':
        return ArticleType.video;
      default:
        return ArticleType.text;
    }
  }
}
