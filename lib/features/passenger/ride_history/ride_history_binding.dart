import 'package:game_on/features/passenger/ride_history/ride_history_controller.dart';
import 'package:get/get.dart';

class RideHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RideHistoryController>(() => RideHistoryController());
  }
}
