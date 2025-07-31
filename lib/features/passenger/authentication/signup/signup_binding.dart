import 'package:get/get.dart';
import 'package:game_on/features/passenger/authentication/signup/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}