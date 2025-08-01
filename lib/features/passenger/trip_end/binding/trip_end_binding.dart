import 'package:get/get.dart';
import '../controller/trip_end_controller.dart';

class TripEndBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TripEndController>(() => TripEndController());
  }
}
