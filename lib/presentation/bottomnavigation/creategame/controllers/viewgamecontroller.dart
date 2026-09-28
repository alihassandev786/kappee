import 'package:get/get.dart';
import 'package:kapee/presentation/bottomnavigation/bottomnavigation/view.dart';

class PlayerPaymentModel {
  final String name;
  final String imageUrl;
  final String status; // 'Paid' or 'Pending'

  PlayerPaymentModel({
    required this.name,
    required this.imageUrl,
    required this.status,
  });
}

class Viewgamecontroller extends GetxController {
  // Active Tab Index
  var selectedTabIndex = 0.obs;

  // Header Details
  var gameTitle = 'Thursday Football ⚽'.obs;
  var gameDateTime = 'Thu,26 Oct - 8:00 PM'.obs;

  // Tabs List
  final List<String> tabs = [
    'Paid (11)',
    'Sending(2)',
    'Paid Game',
    'Approved',
  ];

  // Mock Players List
  var players = <PlayerPaymentModel>[
    PlayerPaymentModel(name: 'John Tan', imageUrl: 'https://i.pravatar.cc/150?img=11', status: 'Paid'),
    PlayerPaymentModel(name: 'John Tan', imageUrl: 'https://i.pravatar.cc/150?img=12', status: 'Paid'),
    PlayerPaymentModel(name: 'John Tan', imageUrl: 'https://i.pravatar.cc/150?img=13', status: 'Paid'),
    PlayerPaymentModel(name: 'John Tan', imageUrl: 'https://i.pravatar.cc/150?img=14', status: 'Paid'),
    PlayerPaymentModel(name: 'John Tan', imageUrl: 'https://i.pravatar.cc/150?img=15', status: 'Paid'),
    PlayerPaymentModel(name: 'John Tan', imageUrl: 'https://i.pravatar.cc/150?img=16', status: 'Pending'),
    PlayerPaymentModel(name: 'John Tan', imageUrl: 'https://i.pravatar.cc/150?img=17', status: 'Pending'),
  ].obs;

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }

  void invitePlayers() {
    Get.to(BottomNavScreen());
  }

  void sendReminder() {
    Get.to(BottomNavScreen());
  }
}