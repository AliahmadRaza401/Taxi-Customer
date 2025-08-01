import 'package:flutter/material.dart';
import 'package:game_on/features/passenger/pick_up/view/cancel_ride_screen.dart';
import 'package:game_on/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/state_manager.dart';

class DriverFoundController extends GetxController {
  RxString driverName = 'Corey Schleifer'.obs;
  RxDouble driverRating = 4.8.obs;
  RxString carInfo = 'Suzuki Swift'.obs;
  RxString carNumber = 'NHK-5678'.obs;

  void callDriver() {
    Get.toNamed(AppRoutes.waitingDriver);
  }

  // void cancelRide() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (_) => const CancelRideScreen()),
  //   );
  // }
}
