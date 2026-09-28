// lib/presentation/bottomnavigation/chat/controllers/chatcontroller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final TextEditingController messageController = TextEditingController();

  var messages = <Map<String, dynamic>>[
    // ... aapka existing data same rakho
  ].obs;

  void sendMessage() {
    if (messageController.text.trim().isNotEmpty) {
      messages.add({
        'sender': 'Me',
        'message': messageController.text.trim(),
        'time': '10:16 PM',
        'isMe': true,
        'avatar': '',
      });
      messageController.clear();
    }
  }

  @override
  void onClose() {
    // IMPORTANT: IndexedStack ke saath dispose mat karo
    // messageController.dispose();  ← yeh line comment/remove kar do
    super.onClose();
  }
}