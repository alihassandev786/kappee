import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RecurringGameController extends GetxController {
  late TextEditingController whatsappController;

  // Recurring Switch Toggle
  var isRecurring = true.obs;

  // REPEAT Dropdown
  var selectedRepeat = 'Every Thursday'.obs;
  final List<String> repeatOptions = [
    'Every Thursday',
    'Every Day',
    'Every Week',
    'Every Month',
  ];

  // STARTING DATE Selection
  var startingDate = DateTime(2024, 5, 23).obs;

  String get formattedStartingDate =>
      DateFormat('EEE, d MMM yyyy').format(startingDate.value);

  // Send Link - DATE Dropdown
  var selectedSendDate = 'Wednesday'.obs;
  final List<String> sendDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  // Send Link - TIME Dropdown
  var selectedSendTime = '6:00 PM'.obs;
  final List<String> sendTimes = [
    '4:00 PM',
    '5:00 PM',
    '6:00 PM',
    '7:00 PM',
    '8:00 PM',
  ];

  @override
  void onInit() {
    super.onInit();
    whatsappController = TextEditingController(text: '+983726182736');
  }

  // Date Picker Logic
  Future<void> pickStartingDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startingDate.value,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      startingDate.value = picked;
    }
  }

  @override
  void onClose() {
    whatsappController.dispose();
    super.onClose();
  }
}