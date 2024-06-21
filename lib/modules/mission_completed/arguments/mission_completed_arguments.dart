import 'package:lines/data/models/mission.dart';
import 'package:lines/data/models/uploaded_product.dart';

class MissionCompletedArguments {
  final Mission? mission;
  final UploadedProduct? uploadedProduct;

  MissionCompletedArguments({
    this.mission,
    this.uploadedProduct,
  });

  factory MissionCompletedArguments.initial() {
    return MissionCompletedArguments(
      mission: null,
      uploadedProduct: null,
    );
  }
}
