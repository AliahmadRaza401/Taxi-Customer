import 'package:game_on/features/passenger/ride_details/ride_model.dart';
import 'package:game_on/routes/app_routes.dart';
import 'package:get/get.dart';

class RideDetailsController extends GetxController {
  var selectedRide = Rxn<RideModel>();
  var showDetails = false.obs;

  @override
  void onInit() {
    super.onInit();
    selectedRide.value = Get.arguments as RideModel?;
  }

  void toggleDetails() {
    showDetails.value = !showDetails.value;
  }

  void viewOnMap() {
    Get.toNamed(AppRoutes.rideMap, arguments: selectedRide.value);
  }
}