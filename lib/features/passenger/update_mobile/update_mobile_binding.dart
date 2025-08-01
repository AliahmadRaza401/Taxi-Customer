import 'package:game_on/features/passenger/update_mobile/update_mobile_controller.dart';
import 'package:get/get.dart';

class UpdateMobileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateMobileController>(() => UpdateMobileController());
  }
}

