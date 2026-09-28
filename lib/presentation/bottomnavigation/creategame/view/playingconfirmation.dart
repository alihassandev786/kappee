import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kapee/core/widgets/button.dart';
import 'package:kapee/presentation/bottomnavigation/creategame/controllers/playingconfirmationcontroller.dart';
import 'package:kapee/presentation/bottomnavigation/creategame/view/paymentthrough.dart';

import '../../../../core/constants/appcolors.dart';
import '../../../../core/widgets/mediaquery.dart';

class Playingconfirmation extends StatefulWidget {
  const Playingconfirmation({Key? key}) : super(key: key);

  @override
  State<Playingconfirmation> createState() => _PlayingconfirmationState();
}

class _PlayingconfirmationState extends State<Playingconfirmation> {
  late final Playingconfirmationcontroller controller;
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    if (Get.isRegistered<Playingconfirmationcontroller>()) {
      controller = Get.find<Playingconfirmationcontroller>();
    } else {
      controller = Get.put(Playingconfirmationcontroller());
    }

    // Screen enter hote hi 3 seconds ke liye confetti blast hogi
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
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
      backgroundColor: const Color(0xFF6B2FB9), // Primary top color
      body: Stack(
        children: [
          // ==========================================
          // LAYER 1: Purple Gradient Header Details
          // ==========================================
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: AppSize.height * 0.32,
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 10,
                left: AppSize.width * 0.04,
                right: AppSize.width * 0.04,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF5125B7),
                    Color(0xFF8700BA),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                          size: AppSize.width * 0.055,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Thursday Football ⚽',
                            style: TextStyle(
                              fontSize: AppSize.width * 0.048,
                              fontFamily: "ps",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: AppSize.width * 0.1),
                    ],
                  ),
                  SizedBox(height: AppSize.height * 0.005),
                  Text(
                    'Thu,26 Oct - 8:00 PM',
                    style: TextStyle(
                      fontSize: AppSize.width * 0.035,
                      fontFamily: "pr",
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  SizedBox(height: AppSize.height * 0.004),
                  Text(
                    'Jalan Besar Stadium',
                    style: TextStyle(
                      fontSize: AppSize.width * 0.035,
                      fontFamily: "pr",
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  SizedBox(height: AppSize.height * 0.012),
                  Obx(() => Text(
                    '${controller.currentJoined.value} / ${controller.totalPlayers.value} Players',
                    style: TextStyle(
                      fontSize: AppSize.width * 0.036,
                      fontFamily: "ps",
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  )),
                ],
              ),
            ),
          ),

          // ==========================================
          // LAYER 2: Confetti Animation Layer
          // (Purple background ke upar, White sheet ke neeche)
          // ==========================================
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirection: pi / 2, // Upward/Downward blast direction
                maxBlastForce: 7,
                minBlastForce: 2,
                emissionFrequency: 0.05,
                numberOfParticles: 25,
                gravity: 0.25,
                colors: const [
                  Colors.amber,
                  Colors.blueAccent,
                  Colors.greenAccent,
                  Colors.pinkAccent,
                  Colors.orange,
                  Colors.white,
                ],
              ),
            ),
          ),

          // ==========================================
          // LAYER 3: White Sheet Details Card (Overlays Confetti)
          // ==========================================
          Positioned.fill(
            top: AppSize.height * 0.28,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width * 0.06,
                    vertical: AppSize.height * 0.035,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Your name Label & Input
                      Text(
                        'Your name',
                        style: TextStyle(
                          fontSize: AppSize.width * 0.038,
                          fontFamily: "ps",
                          fontWeight: FontWeight.bold,
                          color: AppColors.textcolor1,
                        ),
                      ),
                      SizedBox(height: AppSize.height * 0.01),
                      _buildTextField(
                        controller: controller.nameController,
                        hintText: 'Enter name',
                      ),

                      SizedBox(height: AppSize.height * 0.025),

                      // Whatsapp Number Label & Input
                      Text(
                        'Whatsapp Number',
                        style: TextStyle(
                          fontSize: AppSize.width * 0.038,
                          fontFamily: "ps",
                          fontWeight: FontWeight.bold,
                          color: AppColors.textcolor1,
                        ),
                      ),
                      SizedBox(height: AppSize.height * 0.01),
                      _buildTextField(
                        controller: controller.phoneController,
                        hintText: 'Enter whatsapp number',
                        keyboardType: TextInputType.phone,
                      ),

                      SizedBox(height: AppSize.height * 0.025),
                      Divider(color: Colors.grey.shade200, thickness: 1),
                      SizedBox(height: AppSize.height * 0.02),

                      // Are you playing? Question Title
                      Text(
                        'Are you playing?',
                        style: TextStyle(
                          fontSize: AppSize.width * 0.045,
                          fontFamily: "ps",
                          fontWeight: FontWeight.bold,
                          color: AppColors.textcolor1,
                        ),
                      ),

                      SizedBox(height: AppSize.height * 0.02),

                      // Option 1: yes, I'm Playing
                      Obx(() {
                        final isSelected = controller.isPlaying.value;
                        return InkWell(
                          onTap: () => controller.selectPlayingStatus(true),
                          child: Container(
                            height: AppSize.height*0.058,
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSize.width * 0.04,
                              vertical: AppSize.height * 0.016,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF19C35A) // Green fill
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: const Color(0xFF19C35A),
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "yes, I'm Playing ⚽",
                                  style: TextStyle(
                                    fontSize: AppSize.width * 0.038,
                                    fontFamily: "ps",
                                    fontWeight: FontWeight.w600,
                                    color: isSelected
                                        ? Colors.white
                                        : const Color(0xFF19C35A),
                                  ),
                                ),
                                CircleAvatar(
                                  radius: AppSize.width * 0.03,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.check,
                                    size: AppSize.width * 0.04,
                                    color: const Color(0xFF19C35A),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),

                      SizedBox(height: AppSize.height * 0.018),

                      // Option 2: No, can't Play
                      Obx(() {
                        final isSelected = !controller.isPlaying.value;
                        return InkWell(
                          onTap: () => controller.selectPlayingStatus(false),
                          child: Container(
                            height: AppSize.height*0.058,
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSize.width * 0.04,
                              vertical: AppSize.height * 0.016,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFD32F2F) // Red fill
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: const Color(0xFFD32F2F),
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "No, can't Play",
                                  style: TextStyle(
                                    fontSize: AppSize.width * 0.038,
                                    fontFamily: "ps",
                                    fontWeight: FontWeight.w600,
                                    color: isSelected
                                        ? Colors.white
                                        : const Color(0xFFD32F2F),
                                  ),
                                ),
                                CircleAvatar(
                                  radius: AppSize.width * 0.03,
                                  backgroundColor: const Color(0xFFD32F2F),
                                  child: Icon(
                                    Icons.close,
                                    size: AppSize.width * 0.04,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),

                      SizedBox(height: AppSize.height * 0.045),

                      // Continue Button
                      CustomButton(title: "Continue", onTap: (){
                        Get.to(Paymentthrough());
                      }),
                      SizedBox(height: AppSize.height * 0.02),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Custom Input Field Helper
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(
          fontSize: AppSize.width * 0.038,
          fontFamily: "ps",
          fontWeight: FontWeight.bold,
          color: AppColors.textcolor1,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: AppSize.width * 0.035,
            fontFamily: "pr",
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppSize.width * 0.04,
            vertical: AppSize.height * 0.015,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}