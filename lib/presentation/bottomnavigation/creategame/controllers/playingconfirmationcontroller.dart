import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Playingconfirmationcontroller extends GetxController {
  // Text Controllers
  final nameController = TextEditingController(text: 'Jhon Tan');
  final phoneController = TextEditingController(text: '+983726182736');

  // Game Info
  var totalPlayers = 20.obs;
  var currentJoined = 18.obs;

  // Selection State (true for 'yes, I'm Playing', false for 'No, can't Play')
  var isPlaying = true.obs;

  void selectPlayingStatus(bool status) {
    isPlaying.value = status;
  }

  void proceedToNext() {
    Get.snackbar(
      'Success',
      'Details saved successfully!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}