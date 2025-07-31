import 'package:get/get.dart';
import 'package:game_on/features/passenger/authentication/sign_in/sign_in_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}