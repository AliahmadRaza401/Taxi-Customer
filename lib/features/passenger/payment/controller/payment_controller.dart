import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PaymentController extends GetxController {
  RxString promoCode = ''.obs;
  RxString selectedPaymentMethod = 'Stripe'.obs;
  RxDouble price = 1500.0.obs;

  void selectPayment(String method) {
    selectedPaymentMethod.value = method;
  }

  void applyPromo(String code) {
    if (code.toLowerCase() == 'save10') {
      price.value *= 0.9;
    }
  }
}
