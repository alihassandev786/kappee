import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kapee/presentation/bottomnavigation/creategame/view/payment.dart';

import '../../../../core/constants/appcolors.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../controllers/requiringgamecontroller.dart';

class Setupgame extends StatefulWidget {
  const Setupgame({Key? key}) : super(key: key);

  @override
  State<Setupgame> createState() => _SetupgameState();
}

class _SetupgameState extends State<Setupgame> {
  late final RecurringGameController controller;

  @override
  void initState() {
    super.initState();
    if (Get.isRegistered<RecurringGameController>()) {
      controller = Get.find<RecurringGameController>();
    } else {
      controller = Get.put(RecurringGameController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.textcolor1,
            size: AppSize.width * 0.055,
          ),
        ),
        title: Text(
          'Recurring Game Setup',
          style: TextStyle(
            fontSize: AppSize.width * 0.048,
            fontFamily: "ps",
            fontWeight: FontWeight.bold,
            color: AppColors.textcolor1,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.width * 0.05,
            vertical: AppSize.height * 0.015,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. RECURRING GAME ROW WITH SWITCH
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSectionTitle('Recurring Game'),
                  Obx(
                    () => Switch(
                      value: controller.isRecurring.value,
                      activeColor: Colors.white,
                      activeTrackColor: AppColors.primary1,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.grey.shade300,
                      onChanged: (val) => controller.isRecurring.value = val,
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSize.height * 0.015),

              // 2. REPEAT DROPDOWN
              _buildFieldLabel('REPEAT'),
              SizedBox(height: AppSize.height * 0.008),
              Obx(
                () => Container(
                  height: AppSize.height * 0.06,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width * 0.04,
                  ),
                  decoration: _buildInputBoxDecoration(),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: controller.selectedRepeat.value,
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.textcolor1,
                        size: AppSize.width * 0.06,
                      ),
                      items: controller.repeatOptions.map((String option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: AppSize.width * 0.036,
                              fontFamily: "ps",
                              fontWeight: FontWeight.bold,
                              color: AppColors.textcolor1,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) controller.selectedRepeat.value = val;
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(height: AppSize.height * 0.02),

              // 3. STARTING DATE PICKER
              _buildFieldLabel('STARTING DATE'),
              SizedBox(height: AppSize.height * 0.008),
              GestureDetector(
                onTap: () => controller.pickStartingDate(context),
                child: Obx(
                  () => Container(
                    height: AppSize.height * 0.06,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.width * 0.04,
                    ),
                    decoration: _buildInputBoxDecoration(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.formattedStartingDate,
                          style: TextStyle(
                            fontSize: AppSize.width * 0.036,
                            fontFamily: "ps",
                            fontWeight: FontWeight.bold,
                            color: AppColors.textcolor1,
                          ),
                        ),
                        Icon(
                          Icons.calendar_today_outlined,
                          size: AppSize.width * 0.052,
                          color: AppColors.textcolor1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: AppSize.height * 0.025),

              // 4. SEND ME CONNECTIONS
              _buildSectionTitle('SEND ME CONNECTIONS'),
              SizedBox(height: AppSize.height * 0.004),
              Text(
                'Lets connect with the player using the link ID:\n12345678',
                style: TextStyle(
                  fontSize: AppSize.width * 0.032,
                  fontFamily: "pr",
                  height: 1.35,
                  color: AppColors.textcolor2.withOpacity(0.7),
                ),
              ),

              SizedBox(height: AppSize.height * 0.02),

              // 5. WHATSAPP NUMBER
              _buildFieldLabel('WHATSAPP NUMBER'),
              SizedBox(height: AppSize.height * 0.008),
              Container(
                height: AppSize.height * 0.06,
                padding: EdgeInsets.symmetric(horizontal: AppSize.width * 0.04),
                decoration: _buildInputBoxDecoration(),
                child: TextField(
                  controller: controller.whatsappController,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                    fontSize: AppSize.width * 0.036,
                    fontFamily: "ps",
                    fontWeight: FontWeight.bold,
                    color: AppColors.textcolor1,
                  ),
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),

              SizedBox(height: AppSize.height * 0.025),

              // 6. SEND LINK ROW
              _buildSectionTitle('Send Link'),
              SizedBox(height: AppSize.height * 0.012),

              Row(
                children: [
                  // DATE DROPDOWN
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFieldLabel('DATE'),
                        SizedBox(height: AppSize.height * 0.008),
                        Obx(
                          () => Container(
                            height: AppSize.height * 0.06,
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSize.width * 0.035,
                            ),
                            decoration: _buildInputBoxDecoration(),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: controller.selectedSendDate.value,
                                isExpanded: true,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.textcolor1,
                                  size: AppSize.width * 0.055,
                                ),
                                items: controller.sendDays.map((String day) {
                                  return DropdownMenuItem<String>(
                                    value: day,
                                    child: Text(
                                      day,
                                      style: TextStyle(
                                        fontSize: AppSize.width * 0.035,
                                        fontFamily: "ps",
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textcolor1,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  if (val != null) {
                                    controller.selectedSendDate.value = val;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: AppSize.width * 0.04),

                  // TIME DROPDOWN
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFieldLabel('TIME'),
                        SizedBox(height: AppSize.height * 0.008),
                        Obx(
                          () => Container(
                            height: AppSize.height * 0.06,
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSize.width * 0.035,
                            ),
                            decoration: _buildInputBoxDecoration(),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: controller.selectedSendTime.value,
                                isExpanded: true,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.textcolor1,
                                  size: AppSize.width * 0.055,
                                ),
                                items: controller.sendTimes.map((String time) {
                                  return DropdownMenuItem<String>(
                                    value: time,
                                    child: Text(
                                      time,
                                      style: TextStyle(
                                        fontSize: AppSize.width * 0.035,
                                        fontFamily: "ps",
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textcolor1,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  if (val != null) {
                                    controller.selectedSendTime.value = val;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSize.height * 0.03),

              // 7. PREVIEW MESSAGE BOX WITH WHATSAPP LOGO
              Obx(
                () => Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(AppSize.width * 0.045),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0EBF9),
                    // Light purple/lavender background
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primary1.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // WhatsApp Icon / Container
                      Image(
                        image: AssetImage("assets/images/whatsapp.png"),
                        height: AppSize.height * 0.06,
                      ),
                      SizedBox(width: AppSize.width * 0.035),

                      // Dynamic Banner Text
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: 'Your thursday footbal match is ',
                            style: TextStyle(
                              fontSize: AppSize.width * 0.034,
                              fontFamily: "pr",
                              color: AppColors.primary1,
                              height: 1.35,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    '${controller.selectedSendDate.value} at ${controller.selectedSendTime.value} ',
                                style: TextStyle(
                                  fontSize: AppSize.width * 0.034,
                                  fontFamily: "ps",
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary1,
                                ),
                              ),
                              const TextSpan(
                                text: 'reccurring your should must attend.',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: AppSize.height * 0.04),

              // 8. CREATE GAME BUTTON
              CustomButton(
                title: "Create Game",
                textColor: Colors.black,
                onTap: () {
                  Get.to(Payment());
                },
                backgroundColor: AppColors.primary3,
                borderradius: BorderRadius.circular(AppSize.height * 0.012),
              ),
              SizedBox(height: AppSize.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget for Bold Section Titles
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: AppSize.width * 0.036,
        fontFamily: "ps",
        fontWeight: FontWeight.bold,
        color: AppColors.textcolor1,
      ),
    );
  }

  // Helper Widget for Sub Field Labels
  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: AppSize.width * 0.03,
        fontFamily: "ps",
        fontWeight: FontWeight.bold,
        color: AppColors.textcolor1,
        letterSpacing: 0.5,
      ),
    );
  }

  // Common Input Box Styling
  BoxDecoration _buildInputBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade200, width: 1),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.02),
          blurRadius: 6,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }
}
