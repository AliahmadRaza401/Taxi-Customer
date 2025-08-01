import 'package:game_on/features/passenger/ride_details/ride_model.dart';
import 'package:get/get.dart';

class RideHistoryController extends GetxController {
  var selectedTab = 1.obs; // 0 for Upcoming, 1 for History
  var rides = <RideModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadRides();
  }

  void selectTab(int tab) {
    selectedTab.value = tab;
    loadRides();
  }

  void loadRides() {
    isLoading.value = true;
    
    // Simulate API call
    Future.delayed(Duration(milliseconds: 500), () {
      rides.value = [
        RideModel(
          id: '1',
          date: 'Monday',
          time: '6:47 pm',
          pickupLocation: 'Street 49, Park Slope, Nigeria',
          dropoffLocation: '276, Bay Ridge, Nigeria',
          fare: 5000,
          status: 'completed',
          driverName: 'Corey Schleifer',
          driverCode: 'NHH-5678',
          driverVehicle: 'Suzuki Swift',
          distance: 20,
          duration: 60,
          serviceFee: 1250,
          waitingFee: 1250,
          rideCharges: 1250,
          peakFactor: 1.5,
        ),
        RideModel(
          id: '2',
          date: 'Monday',
          time: '6:47 pm',
          pickupLocation: 'Street 49, Park Slope, Nigeria',
          dropoffLocation: '276, Bay Ridge, Nigeria',
          fare: 5000,
          status: 'completed',
          driverName: 'John Doe',
          driverCode: 'ABC-1234',
          driverVehicle: 'Toyota Camry',
          distance: 15,
          duration: 45,
          serviceFee: 1000,
          waitingFee: 1000,
          rideCharges: 2000,
          peakFactor: 1.0,
        ),
        RideModel(
          id: '3',
          date: 'Monday',
          time: '6:47 pm',
          pickupLocation: 'Street 49, Park Slope, Nigeria',
          dropoffLocation: '276, Bay Ridge, Nigeria',
          fare: 5000,
          status: 'completed',
          driverName: 'Jane Smith',
          driverCode: 'XYZ-9876',
          driverVehicle: 'Honda Civic',
          distance: 25,
          duration: 75,
          serviceFee: 1500,
          waitingFee: 800,
          rideCharges: 1700,
          peakFactor: 1.2,
        ),
      ];
      isLoading.value = false;
    });
  }

  void viewRideDetails(RideModel ride) {
    Get.toNamed('/ride-details', arguments: ride);
  }
}