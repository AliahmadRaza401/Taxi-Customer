import 'package:game_on/features/passenger/booking/controller/venue_booking_controller.dart';
import 'package:get/get.dart';

class VenueBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VenueBookingController());
  }
}
