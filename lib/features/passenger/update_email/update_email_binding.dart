
import 'package:game_on/features/passenger/update_email/update_email_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class UpdateEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateEmailController>(() => UpdateEmailController());
  }
}

