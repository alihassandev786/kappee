import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kapee/core/widgets/button.dart';
import 'package:kapee/presentation/bottomnavigation/creategame/controllers/transectionsuccesscontroller.dart';
import 'package:kapee/presentation/bottomnavigation/creategame/view/viewgame.dart';

import '../../../../core/constants/appcolors.dart';
import '../../../../core/widgets/mediaquery.dart';

class Transectionsuccess extends StatefulWidget {
  const Transectionsuccess({Key? key}) : super(key: key);

  @override
  State<Transectionsuccess> createState() => _TransectionsuccessState();
}

class _TransectionsuccessState extends State<Transectionsuccess> {
  late final Transectionsuccesscontroller controller;
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    if (Get.isRegistered<Transectionsuccesscontroller>()) {
      controller = Get.find<Transectionsuccesscontroller>();
    } else {
      controller = Get.put(Transectionsuccesscontroller());
    }

    // Initialize confetti controller to play on screen entry
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Confetti Blast Effect centered at top section
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: AppSize.height * 0.08),
                child: ConfettiWidget(
                  confettiController: _confettiController,
                  blastDirectionality: BlastDirectionality.explosive,
                  maxBlastForce: 10,
                  minBlastForce: 3,
                  emissionFrequency: 0.05,
                  numberOfParticles: 30,
                  gravity: 0.2,
                  colors: const [
                    Colors.amber,
                    Colors.blueAccent,
                    Colors.greenAccent,
                    Colors.pinkAccent,
                    Colors.orange,
                    Colors.purpleAccent,
                  ],
                ),
              ),
            ),

            // Main UI Content
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.width * 0.06,
                vertical: AppSize.height * 0.02,
              ),
              child: Column(
                children: [
                  SizedBox(height: AppSize.height * 0.06),

                  // Yellow Checkmark Icon Circle
                  Center(
                    child: Container(
                      width: AppSize.width * 0.18,
                      height: AppSize.width * 0.18,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFC107), // Amber/Yellow
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check_rounded,
                        size: AppSize.width * 0.14,
                        color: const Color(0xFF3F0097), // Dark Purple
                      ),
                    ),
                  ),

                  SizedBox(height: AppSize.height * 0.03),

                  // Header Text: You're In! 🎉
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You're In!",
                        style: TextStyle(
                          fontSize: AppSize.width * 0.06,
                          fontFamily: "ps",
                          fontWeight: FontWeight.bold,
                          color: AppColors.textcolor1,
                        ),
                      ),
                      SizedBox(width: AppSize.width * 0.02),
                      Text(
                        "🎉",
                        style: TextStyle(fontSize: AppSize.width * 0.065),
                      ),
                    ],
                  ),

                  SizedBox(height: AppSize.height * 0.03),

                  // Payment & Attendance Status Table
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.width * 0.1,
                    ),
                    child: Column(
                      children: [
                        // Payment Row
                        Row(
                          children: [
                            Text(
                              'Payment',
                              style: TextStyle(
                                fontSize: AppSize.width * 0.038,
                                fontFamily: "ps",
                                fontWeight: FontWeight.bold,
                                color: AppColors.textcolor1,
                              ),
                            ),
                            SizedBox(width: AppSize.width * 0.15),
                            Obx(
                              () => Text(
                                controller.paymentStatus.value,
                                style: TextStyle(
                                  fontSize: AppSize.width * 0.04,
                                  fontFamily: "ps",
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF2E7D32), // Green
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: AppSize.height * 0.015),

                        // Attendance Row
                        Row(
                          children: [
                            Text(
                              'Attendance',
                              style: TextStyle(
                                fontSize: AppSize.width * 0.038,
                                fontFamily: "ps",
                                fontWeight: FontWeight.bold,
                                color: AppColors.textcolor1,
                              ),
                            ),
                            SizedBox(width: AppSize.width * 0.15),
                            Obx(
                              () => Text(
                                controller.attendanceStatus.value,
                                style: TextStyle(
                                  fontSize: AppSize.width * 0.04,
                                  fontFamily: "ps",
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF2E7D32), // Green
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: AppSize.height * 0.05),

                  // Game Info Card
                  Container(
                    padding: EdgeInsets.all(AppSize.width * 0.045),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.grey.shade200,
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => Text(
                                  controller.gameTitle.value,
                                  style: TextStyle(
                                    fontSize: AppSize.width * 0.042,
                                    fontFamily: "ps",
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textcolor1,
                                  ),
                                ),
                              ),
                              SizedBox(height: AppSize.height * 0.012),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_outlined,
                                    size: AppSize.width * 0.038,
                                    color: Colors.black87,
                                  ),
                                  SizedBox(width: AppSize.width * 0.02),
                                  Obx(
                                    () => Text(
                                      controller.gameTime.value,
                                      style: TextStyle(
                                        fontSize: AppSize.width * 0.032,
                                        fontFamily: "pr",
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: AppSize.height * 0.008),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: AppSize.width * 0.04,
                                    color: Colors.black87,
                                  ),
                                  SizedBox(width: AppSize.width * 0.02),
                                  Obx(
                                    () => Text(
                                      controller.location.value,
                                      style: TextStyle(
                                        fontSize: AppSize.width * 0.032,
                                        fontFamily: "pr",
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: AppSize.width * 0.045,
                          color: Colors.black87,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.height * 0.1),
                  CustomButton(
                    title: "Add to Calender",
                    onTap: () {},
                    backgroundColor: Colors.transparent,
                    borderColor: AppColors.primary1,
                    leftWidget: Icon(
                      Icons.calendar_month,
                      color: AppColors.primary1,
                    ),
                    textColor: Colors.black,
                    leftPadding: EdgeInsets.symmetric(
                      horizontal: AppSize.height * 0.04,
                    ),
                  ),
                  SizedBox(height: AppSize.height * 0.012),
                  CustomButton(title: "View Game", onTap: () {
                    Get.to(Viewgame());
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
