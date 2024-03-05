import 'package:get/get.dart';
import 'package:lines/data/models/advices_article_detail_pair.dart';

class AdvicesDetailStore extends GetxController {
  final Rxn<AdvicesDetailPair> rxArticleDetail = Rxn<AdvicesDetailPair>();
  AdvicesDetailPair? get articleDetail => rxArticleDetail.value;
  set articleDetail(AdvicesDetailPair? newArticleDetail) {
    rxArticleDetail.value = newArticleDetail;
  }
}
