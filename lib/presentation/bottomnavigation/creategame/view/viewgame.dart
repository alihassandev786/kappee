import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kapee/presentation/bottomnavigation/creategame/controllers/viewgamecontroller.dart';

import '../../../../core/constants/appcolors.dart';
import '../../../../core/widgets/mediaquery.dart';

class Viewgame extends StatefulWidget {
  const Viewgame({Key? key}) : super(key: key);

  @override
  State<Viewgame> createState() => _ViewgameState();
}

class _ViewgameState extends State<Viewgame> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Viewgamecontroller(), permanent: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: AppSize.width * 0.05,
          ),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Obx(() => Text(
              controller.gameTitle.value,
              style: TextStyle(
                fontSize: AppSize.width * 0.045,
                fontFamily: "ps",
                fontWeight: FontWeight.bold,
                color: AppColors.textcolor1,
              ),
            )),
            SizedBox(height: AppSize.height * 0.003),
            Obx(() => Text(
              controller.gameDateTime.value,
              style: TextStyle(
                fontSize: AppSize.width * 0.032,
                fontFamily: "pr",
                color: Colors.grey.shade600,
              ),
            )),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
              size: AppSize.width * 0.06,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: AppSize.height * 0.01),

          // Custom Scrollable Tab Bar
          SizedBox(
            height: AppSize.height * 0.05,
            child:  ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: AppSize.width * 0.04),
              itemCount: controller.tabs.length,
              itemBuilder: (context, index) {
                final isSelected = controller.selectedTabIndex.value == index;
                return GestureDetector(
                  onTap: () => controller.changeTab(index),
                  child: Container(
                    margin: EdgeInsets.only(right: AppSize.width * 0.05),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.width * 0.02,
                      vertical: AppSize.height * 0.008,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: isSelected ? const Color(0xFF6B2FB9) : Colors.transparent,
                          width: 2.5,
                        ),
                      ),
                    ),
                    child: Text(
                      controller.tabs[index],
                      style: TextStyle(
                        fontSize: AppSize.width * 0.038,
                        fontFamily: "ps",
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                        color: isSelected ? const Color(0xFF6B2FB9) : Colors.grey.shade600,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Divider(color: Colors.grey.shade200, height: 1, thickness: 1),

          // Player List
          Expanded(
            child: Obx(() => ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.width * 0.05,
                vertical: AppSize.height * 0.015,
              ),
              itemCount: controller.players.length,
              itemBuilder: (context, index) {
                final player = controller.players[index];
                final isPaid = player.status == 'Paid';

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSize.height * 0.01),
                  child: Row(
                    children: [
                      // Profile Image Avatar
                      CircleAvatar(
                        radius: AppSize.width * 0.06,
                        backgroundColor: Colors.grey.shade200,
                        backgroundImage: NetworkImage(player.imageUrl),
                      ),
                      SizedBox(width: AppSize.width * 0.04),

                      // Player Name
                      Text(
                        player.name,
                        style: TextStyle(
                          fontSize: AppSize.width * 0.038,
                          fontFamily: "ps",
                          fontWeight: FontWeight.bold,
                          color: AppColors.textcolor1,
                        ),
                      ),

                      const Spacer(),

                      // Status Badge (Paid / Pending)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSize.width * 0.04,
                          vertical: AppSize.height * 0.006,
                        ),
                        decoration: BoxDecoration(
                          color: isPaid
                              ? const Color(0xFFE8F5E9) // Light Green
                              : const Color(0xFFFFF8E1), // Light Amber
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          player.status,
                          style: TextStyle(
                            fontSize: AppSize.width * 0.032,
                            fontFamily: "ps",
                            fontWeight: FontWeight.bold,
                            color: isPaid
                                ? const Color(0xFF2E7D32) // Dark Green
                                : const Color(0xFFFFB300), // Dark Amber
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )),
          ),

          // Buttons directly below player rows with proper spacing
          Padding(
            padding: EdgeInsets.only(
              left: AppSize.width * 0.05,
              right: AppSize.width * 0.05,
              top: AppSize.height * 0.015,
              bottom: AppSize.height * 0.19,
            ),
            child: Row(
              children: [
                // Invite Players Button
                Expanded(
                  child: Container(
                    height: AppSize.height * 0.058,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300, width: 1.5),
                    ),
                    child: OutlinedButton.icon(
                      onPressed: () => controller.invitePlayers(),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: Icon(
                        Icons.group_add_outlined,
                        color: const Color(0xFF6B2FB9),
                        size: AppSize.width * 0.05,
                      ),
                      label: Text(
                        'Invite Players',
                        style: TextStyle(
                          fontSize: AppSize.width * 0.033,
                          fontFamily: "ps",
                          fontWeight: FontWeight.bold,
                          color: AppColors.textcolor1,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: AppSize.width * 0.03),

                // Send Reminder Button
                Expanded(
                  child: Container(
                    height: AppSize.height * 0.058,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFC107), // Yellow/Amber Accent
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () => controller.sendReminder(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: Icon(
                        Icons.notifications_none_rounded,
                        color: Colors.black,
                        size: AppSize.width * 0.05,
                      ),
                      label: Text(
                        'Send Reminder',
                        style: TextStyle(
                          fontSize: AppSize.width * 0.033,
                          fontFamily: "ps",
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}