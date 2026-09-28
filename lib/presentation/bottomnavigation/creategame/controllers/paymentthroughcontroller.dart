import 'package:get/get.dart';

class JoinGameController extends GetxController {
  // Game & Fee Details
  var gameFee = 12.00.obs;
  var serviceFee = 0.84.obs;

  double get totalAmount => gameFee.value + serviceFee.value;

  // Payment Method Selection
  var selectedPaymentMethod = 'Pay Now'.obs;

  void setPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }

  void processPayment() {
    Get.snackbar(
      'Payment Successful',
      'You have successfully joined the game!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}