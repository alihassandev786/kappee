import 'package:get/get.dart';

class PaymentController extends GetxController {
  // Total stats
  var totalCollected = 132.obs;
  var paidCount = 11.obs;
  var unpaidCount = 1.obs;

  // Selected Tab Index (0 for Paid, 1 for Unpaid)
  var selectedTabIndex = 0.obs;

  // Mock list for Paid Users
  var paidUsers = <Map<String, dynamic>>[
    {
      'name': 'John Tan',
      'status': 'Paid',
      'dateTime': '23 Mar, 8:00 PM',
      'avatar': 'assets/images/profile.png',
    },
    {
      'name': 'John Tan',
      'status': 'Paid',
      'dateTime': '23 Mar, 8:00 PM',
      'avatar': 'assets/images/profile.png',
    },
    {
      'name': 'John Tan',
      'status': 'Paid',
      'dateTime': '23 Mar, 8:00 PM',
      'avatar': 'assets/images/profile.png',
    },
    {
      'name': 'John Tan',
      'status': 'Paid',
      'dateTime': '23 Mar, 8:00 PM',
      'avatar': 'assets/images/profile.png',
    },
    {
      'name': 'John Tan',
      'status': 'Paid',
      'dateTime': '23 Mar, 8:00 PM',
      'avatar': 'assets/images/profile.png',
    },
  ].obs;

  // Mock list for Unpaid Users
  var unpaidUsers = <Map<String, dynamic>>[
    {
      'name': 'Alex Smith',
      'status': 'Unpaid',
      'dateTime': '23 Mar, 8:00 PM',
      'avatar': 'assets/images/profile.png',
    },
  ].obs;

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }

  void withdrawMoney() {
    // Withdraw button action logic
    Get.snackbar(
      'Withdraw',
      'Withdrawal request submitted successfully!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}