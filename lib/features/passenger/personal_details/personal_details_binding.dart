import 'package:game_on/features/passenger/personal_details/personal_details_controller.dart';
import 'package:get/get.dart';

class PersonalDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalDetailsController>(() => PersonalDetailsController());
  }
}
