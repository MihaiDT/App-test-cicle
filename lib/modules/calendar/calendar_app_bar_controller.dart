import 'package:get/get.dart';
import 'package:super_tooltip/super_tooltip.dart';

class CalendarAppBarController extends GetxController {
  final tooltipController = SuperTooltipController();

  Future<bool> onActionTap() async {
    if (tooltipController.isVisible) {
      await tooltipController.hideTooltip();
      return false;
    } else {
      tooltipController.showTooltip();
      return true;
    }
  }
}
