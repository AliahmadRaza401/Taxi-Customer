import 'package:get/get.dart';
import 'invite_friend_controller.dart';

class InviteFriendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InviteFriendController>(() => InviteFriendController());
  }
}
