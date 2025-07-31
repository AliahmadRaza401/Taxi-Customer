import 'package:get/get.dart';
import 'continue_controller.dart';

class ContinueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContinueController>(() => ContinueController());
  }
}