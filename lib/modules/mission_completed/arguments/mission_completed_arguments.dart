import 'package:lines/data/models/mission.dart';
import 'package:lines/data/models/uploaded_product.dart';

class MissionCompletedArguments {
  final Mission? mission;
  final UploadedProduct uploadedProduct;

  MissionCompletedArguments({
    this.mission,
    required this.uploadedProduct,
  });
}
