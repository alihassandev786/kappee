import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateGameController extends GetxController {
  // Form Field Controllers
  late TextEditingController venueController;
  late TextEditingController priceController;
  late TextEditingController gameNameController;

  // Sport Dropdown
  var selectedSport = 'Football'.obs;
  final List<String> sportsList = ['Football', 'Cricket', 'Basketball', 'Tennis', 'Badminton'];

  // Date Selection
  var selectedDate = DateTime(2024, 5, 23).obs;

  String get formattedDate => DateFormat('EEE, d MMM yyyy').format(selectedDate.value);

  // Time Selection
  var selectedTime = const TimeOfDay(hour: 20, minute: 0).obs;

  String get formattedTime {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, selectedTime.value.hour, selectedTime.value.minute);
    return DateFormat('h:mm a').format(dt);
  }

  // Players Counter
  var playerCount = 18.obs;

  void incrementPlayer() {
    playerCount.value++;
  }

  void decrementPlayer() {
    if (playerCount.value > 1) {
      playerCount.value--;
    }
  }

  // Recurring Switch & Repeat Dropdown
  var isRecurring = true.obs;
  var selectedRepeatOption = 'Every Thursday'.obs;
  final List<String> repeatOptions = ['Every Thursday', 'Every Day', 'Every Week', 'Every Month'];

  @override
  void onInit() {
    super.onInit();
    venueController = TextEditingController(text: 'Jolan Seear stadium');
    priceController = TextEditingController(text: '\$10');
    gameNameController = TextEditingController(text: 'Game');
  }

  // Date Picker Logic
  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  // Time Picker Logic
  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );
    if (picked != null) {
      selectedTime.value = picked;
    }
  }
}