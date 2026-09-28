// lib/presentation/bottomnavigation/discover/controllers/discovercontroller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoverController extends GetxController {
  final searchController = TextEditingController();

  var selectedCategoryIndex = 1.obs;

  final List<String> categories = [
    'All Sports',
    'Football',
    'Cricket',
    'Today',
  ];

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  @override
  void onClose() {
    // IMPORTANT: IndexedStack ke saath dispose mat karo
    // searchController.dispose();  ← yeh line comment/remove kar do
    super.onClose();
  }
}