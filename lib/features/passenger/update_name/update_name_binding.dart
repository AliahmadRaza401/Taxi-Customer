import 'package:game_on/features/passenger/update_name/update_name_controller.dart';
import 'package:get/get.dart';

class UpdateNameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateNameController>(() => UpdateNameController());
  }
}
