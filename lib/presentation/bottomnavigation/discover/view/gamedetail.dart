import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kapee/core/widgets/button.dart';
import 'package:kapee/presentation/bottomnavigation/bottomnavigation/view.dart';

import '../../../../core/constants/appcolors.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../controllers/gamedetailcontroller.dart';

class Gamedetail extends StatefulWidget {
  const Gamedetail({Key? key}) : super(key: key);

  @override
  State<Gamedetail> createState() => _GamedetailState();
}

class _GamedetailState extends State<Gamedetail> {
  @override
  Widget build(BuildContext context) {
    final GameDetailController controller = Get.put(GameDetailController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Top Image Section with Specific Height Container
            SizedBox(
              height: AppSize.height * 0.28,
              width: double.infinity,
              child: Stack(
                children: [
                  // Image
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/gamedetail.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Dark Gradient Overlay for Icons visibility

                  // Top Action Bar Icons
                  Positioned(
                    top:
                        MediaQuery.of(context).padding.top +
                        AppSize.height * 0.005,
                    left: AppSize.width * 0.03,
                    right: AppSize.width * 0.03,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: AppSize.width * 0.065,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.white,
                                size: AppSize.width * 0.065,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.more_vert,
                                color: Colors.white,
                                size: AppSize.width * 0.065,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 2. White Background Main Content Container
            Transform.translate(
              offset: Offset(0, -AppSize.height * 0.06),
              // Creates overlay effect
              child: Container(
                width: AppSize.width * 0.95,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.width * 0.06,
                  vertical: AppSize.height * 0.02,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      offset: Offset(1, 0),
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ],
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(AppSize.height * 0.03),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title & Icon Row
                    Row(
                      children: [
                        Text(
                          'Thursday Football',
                          style: TextStyle(
                            fontSize: AppSize.width * 0.052,
                            fontFamily: "ps",
                            fontWeight: FontWeight.bold,
                            color: AppColors.textcolor1,
                          ),
                        ),
                        SizedBox(width: AppSize.width * 0.02),
                        Text(
                          '⚽',
                          style: TextStyle(fontSize: AppSize.width * 0.045),
                        ),
                      ],
                    ),

                    SizedBox(height: AppSize.height * 0.01),

                    // Location
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: AppSize.width * 0.042,
                          color: AppColors.textcolor2.withOpacity(0.7),
                        ),
                        SizedBox(width: AppSize.width * 0.015),
                        Text(
                          'Jalan Besar Stadium',
                          style: TextStyle(
                            fontSize: AppSize.width * 0.033,
                            fontFamily: "pr",
                            fontWeight: FontWeight.w600,
                            color: AppColors.textcolor2.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppSize.height * 0.006),

                    // Date & Time
                    Text(
                      'Thu,  26 Oct  -  8:00 PM',
                      style: TextStyle(
                        fontSize: AppSize.width * 0.033,
                        fontFamily: "pr",
                        fontWeight: FontWeight.w600,
                        color: AppColors.textcolor2.withOpacity(0.7),
                      ),
                    ),

                    SizedBox(height: AppSize.height * 0.025),

                    // Stats Grid Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatColumn('Players', '16 / 18'),
                        _buildStatColumn('Play', '14'),
                        _buildStatColumn('Payment', '2'),
                        _buildStatColumn('play', '2'),
                      ],
                    ),

                    SizedBox(height: AppSize.height * 0.015),

                    // Linear Progress Bar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: 16 / 18,
                        minHeight: AppSize.height * 0.01,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primary1,
                        ),
                      ),
                    ),

                    SizedBox(height: AppSize.height * 0.03),

                    // Payment Title
                    Text(
                      'Payment',
                      style: TextStyle(
                        fontSize: AppSize.width * 0.035,
                        fontFamily: "pr",
                        fontWeight: FontWeight.w600,
                        color: AppColors.textcolor2.withOpacity(0.7),
                      ),
                    ),

                    SizedBox(height: AppSize.height * 0.012),

                    // Payment Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Feet 16',
                          style: TextStyle(
                            fontSize: AppSize.width * 0.038,
                            fontFamily: "ps",
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          'Keeper',
                          style: TextStyle(
                            fontSize: AppSize.width * 0.038,
                            fontFamily: "ps",
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary3,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: '\$119 ',
                            style: TextStyle(
                              fontSize: AppSize.width * 0.042,
                              fontFamily: "ps",
                              fontWeight: FontWeight.bold,
                              color: AppColors.textcolor1,
                            ),
                            children: [
                              TextSpan(
                                text: 'collected',
                                style: TextStyle(
                                  fontSize: AppSize.width * 0.035,
                                  fontFamily: "pr",
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.textcolor2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppSize.height * 0.03),

                    // ORGANIZER Section
                    Text(
                      'ORGANIZER',
                      style: TextStyle(
                        fontSize: AppSize.width * 0.032,
                        fontFamily: "pb",
                        fontWeight: FontWeight.bold,
                        color: AppColors.textcolor1,
                        letterSpacing: 0.5,
                      ),
                    ),

                    SizedBox(height: AppSize.height * 0.015),

                    // Profile Row
                    Row(
                      children: [
                        CircleAvatar(
                          radius: AppSize.width * 0.06,
                          backgroundColor: Colors.grey.shade300,
                          backgroundImage: const AssetImage(
                            'assets/images/profile.png',
                          ),
                          child: const Icon(Icons.person, color: Colors.white),
                        ),
                        SizedBox(width: AppSize.width * 0.03),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Alex Tan',
                                style: TextStyle(
                                  fontSize: AppSize.width * 0.04,
                                  fontFamily: "ps",
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textcolor1,
                                ),
                              ),
                              SizedBox(height: AppSize.height * 0.002),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: AppSize.width * 0.035,
                                    color: Colors.amber,
                                  ),
                                  SizedBox(width: AppSize.width * 0.01),
                                  Text(
                                    'All',
                                    style: TextStyle(
                                      fontSize: AppSize.width * 0.03,
                                      fontFamily: "pr",
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.width * 0.045,
                            vertical: AppSize.height * 0.008,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            'Message',
                            style: TextStyle(
                              fontSize: AppSize.width * 0.03,
                              fontFamily: "ps",
                              fontWeight: FontWeight.bold,
                              color: AppColors.textcolor1,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppSize.height * 0.035),

                    // Action Icons List Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildActionButton(
                          controller: controller,
                          index: 0,
                          icon: Icons.person_outline,
                          label: 'Stay Game',
                        ),
                        _buildActionButton(
                          controller: controller,
                          index: 1,
                          icon: Icons.notifications_none_outlined,
                          label: 'Notify',
                        ),
                        _buildActionButton(
                          controller: controller,
                          index: 2,
                          icon: Icons.group_outlined,
                          label: 'Join Players',
                        ),
                        _buildActionButton(
                          controller: controller,
                          index: 3,
                          icon: Icons.assignment_turned_in_outlined,
                          label: 'Lists',
                        ),
                      ],
                    ),

                    SizedBox(height: AppSize.height * 0.035),

                    // Share Game Link Button
                    CustomButton(
                      title: "Share Game Link",
                      onTap: () {
                        Get.offAll(BottomNavScreen());
                      },
                      leftPadding: EdgeInsets.symmetric(
                        horizontal: AppSize.height * 0.034,
                      ),
                      leftWidget: Transform.rotate(
                        angle: 2.4,
                        child: Icon(Icons.link, color: AppColors.background),
                      ),
                    ),

                    SizedBox(height: AppSize.height * 0.01),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Stats Column
  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: AppSize.width * 0.032,
            fontFamily: "pr",
            fontWeight: FontWeight.w600,
            color: AppColors.textcolor2.withOpacity(0.7),
          ),
        ),
        SizedBox(height: AppSize.height * 0.008),
        Text(
          value,
          style: TextStyle(
            fontSize: AppSize.width * 0.045,
            fontFamily: "ps",
            fontWeight: FontWeight.bold,
            color: AppColors.textcolor1,
          ),
        ),
      ],
    );
  }

  // Action Button Item
  Widget _buildActionButton({
    required GameDetailController controller,
    required int index,
    required IconData icon,
    required String label,
  }) {
    return Obx(() {
      final isSelected = controller.selectedActionIndex.value == index;

      return GestureDetector(
        onTap: () => controller.selectAction(index),
        child: Column(
          children: [
            Container(
              width: AppSize.width * 0.14,
              height: AppSize.width * 0.14,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary3 : AppColors.background,
                borderRadius: BorderRadius.circular(16),
                boxShadow: isSelected
                    ? []
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.black : AppColors.primary1,
                size: AppSize.width * 0.065,
              ),
            ),
            SizedBox(height: AppSize.height * 0.008),
            Text(
              label,
              style: TextStyle(
                fontSize: AppSize.width * 0.028,
                fontFamily: "pr",
                fontWeight: FontWeight.w600,
                color: AppColors.textcolor2,
              ),
            ),
          ],
        ),
      );
    });
  }
}
