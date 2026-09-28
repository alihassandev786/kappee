import 'package:get/get.dart';

class BottomNavController extends GetxController {
  // Current tab index track karne ke liye
  var currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}