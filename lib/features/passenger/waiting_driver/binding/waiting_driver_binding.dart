import 'package:game_on/features/passenger/waiting_driver/controller/waiting_driver_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class WaitingDriverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaitingDriverController>(() => WaitingDriverController());
  }
}
