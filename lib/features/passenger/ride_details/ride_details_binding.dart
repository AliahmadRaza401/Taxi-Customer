import 'package:game_on/features/passenger/ride_details/ride_details_controller.dart';
import 'package:get/get.dart';

class RideDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RideDetailsController>(() => RideDetailsController());
  }
}
