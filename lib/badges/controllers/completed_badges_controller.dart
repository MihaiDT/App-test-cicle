import 'package:get/get.dart';
import 'package:lines/data/models/badge.dart';

class CompletedBadgesController extends GetxController {
  List<Badge> get badges {
    return [
      Badge(
        name: "name",
        description: "description",
        progressText: "2/10",
        progressValue: 0.2,
      ),
      Badge(
        name: "name",
        description: "description",
        progressText: "2/10",
        progressValue: 0.2,
      ),
      Badge(
        name: "name",
        description: "description",
        progressText: "2/10",
        progressValue: 0.2,
      ),
      Badge(
        name: "name",
        description: "description",
        progressText: "2/10",
        progressValue: 0.2,
      ),
    ];
  }
}
