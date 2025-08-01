import 'package:get/get.dart';
import 'support_chat_controller.dart';

class SupportChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportChatController>(() => SupportChatController());
  }
}
