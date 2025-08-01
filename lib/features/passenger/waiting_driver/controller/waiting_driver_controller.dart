import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class WaitingDriverController extends GetxController {
  RxString driverEta = '4 mins'.obs;
  RxInt fare = 5000.obs;

  void cancelRide() {
    // Logic to cancel the ride
  }
}
