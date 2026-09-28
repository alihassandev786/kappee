import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Core imports
import '../../../core/constants/appcolors.dart';
import '../../../core/widgets/mediaquery.dart';

// Controller import

// View Screens imports (Aapke project path ke according)
import '../home/view/home.dart';
import '../discover/view/discovergame.dart';
import '../creategame/view/creategame.dart';
import '../chat/view/chat.dart';
import '../profile/View/profile.dart';
import 'controller.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.put(BottomNavController());

    // Tab ke hisaab se screens ki list
    final List<Widget> screens = [
      const Home(),
      const Discovergame(),
      const Creategame(),
      const Chat(),
      const Profile(),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(() => IndexedStack(
        index: controller.currentIndex.value,
        children: screens,
      )),

      // Floating Action Button Center (+) Widget
      floatingActionButton: Transform.translate(
        offset: const Offset(0, 22), // Offset Y value badhane se button neeche shift hoga
        child: SizedBox(
          height: AppSize.width * 0.15,
          width: AppSize.width * 0.15,
          child: FloatingActionButton(
            onPressed: () => controller.changeTab(2), // Create Game Tab Index (2)
            backgroundColor: Colors.amber, // Center yellow button color
            elevation: 4,
            shape: const CircleBorder(),
            child: Icon(
              Icons.add,
              size: AppSize.width * 0.08,
              color: Colors.black,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom Curved Navigation Bar
      bottomNavigationBar: Obx(
            () => BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          clipBehavior: Clip.antiAlias,
          elevation: 10,
          color: AppColors.background,
          child: Container(
            height: AppSize.height * 0.075,
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left Side Items (Home, Discover)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNavItem(
                      icon: Icons.home_rounded,
                      label: 'Home',
                      index: 0,
                      controller: controller,
                    ),
                    _buildNavItem(
                      icon: Icons.search_rounded,
                      label: 'Discover',
                      index: 1,
                      controller: controller,
                    ),
                  ],
                ),

                // Center Gap for Floating Action Button
                SizedBox(width: AppSize.width * 0.12),

                // Right Side Items (Messages, Profile)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNavItem(
                      icon: Icons.chat_bubble_outline_rounded,
                      label: 'Messages',
                      index: 3,
                      controller: controller,
                    ),
                    _buildNavItem(
                      icon: Icons.person_outline_rounded,
                      label: 'Profile',
                      index: 4,
                      controller: controller,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Custom Navigation Item Builder Widget
  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required BottomNavController controller,
  }) {
    final bool isSelected = controller.currentIndex.value == index;

    return MaterialButton(
      minWidth: AppSize.width * 0.18,
      padding: EdgeInsets.zero,
      onPressed: () => controller.changeTab(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.primary1 : Colors.grey,
            size: AppSize.width * 0.065,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: AppSize.width * 0.028,
              fontFamily: isSelected ? "ps" : "pr",
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? AppColors.primary1 : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}