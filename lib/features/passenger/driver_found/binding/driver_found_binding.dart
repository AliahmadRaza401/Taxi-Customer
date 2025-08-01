import 'package:game_on/features/passenger/driver_found/controller/driver_found_controller.dart';
import 'package:get/get.dart';

class DriverFoundBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverFoundController>(() => DriverFoundController());
  }
}
