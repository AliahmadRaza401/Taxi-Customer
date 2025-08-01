import 'package:game_on/features/passenger/ride_map/ride_map_controller.dart';
import 'package:get/get.dart';

class RideMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RideMapController>(() => RideMapController());
  }
}
