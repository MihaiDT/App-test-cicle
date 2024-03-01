import 'package:get/get.dart';
import 'package:lines/modules/invite_friend/invite_friend_controller.dart';

class InviteFriendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InviteFriendController>(() => InviteFriendController());
  }
}
