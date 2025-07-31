import 'package:game_on/features/passenger/pick_up/controller/location_controller.dart';
import 'package:get/get.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationController>(() => LocationController());
  }
}
