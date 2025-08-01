import 'package:get/get.dart';

class TripEndController extends GetxController {
  RxInt selectedRating = 0.obs;

  void submitRating() {
    print('Submitted rating: ${selectedRating.value}');
    // Add submit logic (API or local handling)
  }

  void reportDriver() {
    print('Report Driver tapped');
    // Navigate to report screen or show dialog
  }
}
