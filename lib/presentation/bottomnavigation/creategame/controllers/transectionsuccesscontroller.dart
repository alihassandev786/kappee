import 'package:get/get.dart';

class Transectionsuccesscontroller extends GetxController {
  var gameTitle = 'Thursday Football ⚽'.obs;
  var gameTime = 'Thu,26 Oct - 8:00 PM'.obs;
  var location = 'Jalan Besar Stadium'.obs;
  var paymentStatus = 'Paid'.obs;
  var attendanceStatus = 'Confirmed'.obs;

  void addToCalendar() {
    Get.snackbar(
      'Calendar',
      'Event added to your calendar successfully!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void viewGame() {
    // Navigate to Game Details Screen
    Get.back();
  }
}