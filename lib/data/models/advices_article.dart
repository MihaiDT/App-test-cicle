import 'package:lines/data/models/advices_category.dart';

class AdvicesArticle {
  final String articleCategoryId;
  final int id;
  final ArticleType typology;
  final String title;
  final String? disclaimer;
  final String iconName;
  late final String? coverImageUrl;
  late final List<String>? slideshowImageUrls;
  late final String? shortDescription;
  late final String? text;
  late final String? thumbImageUrl;
  late final String? videoImagePreviewUrl;
  late final String? videoUrl;

  AdvicesArticle.textType({
    required this.articleCategoryId,
    required this.id,
    required this.typology,
    required this.title,
    required this.disclaimer,
    required this.iconName,
    required this.coverImageUrl,
    required this.shortDescription,
    required this.text,
    required this.thumbImageUrl,
  }) {
    videoUrl = null;
    videoImagePreviewUrl = null;
    slideshowImageUrls = null;
  }

  AdvicesArticle.sliderType({
    required this.articleCategoryId,
    required this.id,
    required this.typology,
    required this.title,
    required this.disclaimer,
    required this.iconName,
    required this.coverImageUrl,
    required this.thumbImageUrl,
    required this.slideshowImageUrls,
  }) {
    videoUrl = null;
    videoImagePreviewUrl = null;
    text = null;
    shortDescription = null;
  }

  AdvicesArticle.videoType({
    required this.articleCategoryId,
    required this.id,
    required this.typology,
    required this.title,
    required this.disclaimer,
    required this.iconName,
    required this.thumbImageUrl,
    required this.videoImagePreviewUrl,
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
          iconName: data['icon_name'],
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
          iconName: data['icon_name'],
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
          iconName: data['icon_name'],
          thumbImageUrl: data['thumb_image_url'],
          videoImagePreviewUrl: data['video_image_preview_url'],
          videoUrl: data['video_url'],
        );
    }
  }

  AdvicesCategory get getParentCategoryWithoutTitle {
    return AdvicesCategory.fromIconName(iconName);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'articleCategoryId': articleCategoryId,
      'id': id,
      'typology': typology.toString().split('.').last,
      'title': title,
      'disclaimer': disclaimer,
    };

    if (coverImageUrl != null) {
      json['coverImageUrl'] = coverImageUrl;
    }
    if (slideshowImageUrls != null) {
      json['slideshowImageUrls'] = slideshowImageUrls;
    }
    if (shortDescription != null) {
      json['shortDescription'] = shortDescription;
    }
    if (text != null) {
      json['text'] = text;
    }
    if (thumbImageUrl != null) {
      json['thumbImageUrl'] = thumbImageUrl;
    }
    if (videoImagePreviewUrl != null) {
      json['videoImagePreview'] = videoImagePreviewUrl;
    }
    if (videoUrl != null) {
      json['videoUrl'] = videoUrl;
    }

    return json;
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
