import 'package:get/get.dart';

class GameDetailController extends GetxController {
  // Active selected action tab index (0: Stay Game, 1: Notify, 2: Join Players, 3: Lists)
  var selectedActionIndex = 0.obs;

  void selectAction(int index) {
    selectedActionIndex.value = index;
  }
}