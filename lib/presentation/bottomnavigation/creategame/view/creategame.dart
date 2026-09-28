import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kapee/core/widgets/button.dart';
import 'package:kapee/presentation/bottomnavigation/creategame/view/setupgame.dart';

import '../../../../core/constants/appcolors.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../controllers/creategamecontroller.dart';

class Creategame extends StatefulWidget {
  const Creategame({Key? key}) : super(key: key);

  @override
  State<Creategame> createState() => _CreategameState();
}

class _CreategameState extends State<Creategame> {
  @override
  Widget build(BuildContext context) {
    final CreateGameController controller = Get.put(CreateGameController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.textcolor1,
            size: AppSize.width * 0.065,
          ),
        ),
        title: Text(
          'Create New Game',
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
              // 1. SPORT FIELD DROPDOWN
              _buildFieldLabel('SPORT'),
              SizedBox(height: AppSize.height * 0.008),
              Obx(
                () => Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width * 0.04,
                  ),
                  decoration: _buildInputBoxDecoration(),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: controller.selectedSport.value,
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.textcolor1,
                        size: AppSize.width * 0.06,
                      ),
                      items: controller.sportsList.map((String sport) {
                        return DropdownMenuItem<String>(
                          value: sport,
                          child: Row(
                            children: [
                              Text(
                                '⚽ ',
                                style: TextStyle(
                                  fontSize: AppSize.width * 0.045,
                                ),
                              ),
                              SizedBox(width: AppSize.width * 0.02),
                              Text(
                                sport,
                                style: TextStyle(
                                  fontSize: AppSize.width * 0.036,
                                  fontFamily: "ps",
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textcolor1,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null)
                          controller.selectedSport.value = value;
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(height: AppSize.height * 0.02),

              // 2. DATE PICKER
              _buildFieldLabel('DATE'),
              SizedBox(height: AppSize.height * 0.008),
              GestureDetector(
                onTap: () => controller.pickDate(context),
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
                          controller.formattedDate,
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

              SizedBox(height: AppSize.height * 0.02),

              // 3. TIME PICKER
              _buildFieldLabel('TIME'),
              SizedBox(height: AppSize.height * 0.008),
              GestureDetector(
                onTap: () => controller.pickTime(context),
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
                          controller.formattedTime,
                          style: TextStyle(
                            fontSize: AppSize.width * 0.036,
                            fontFamily: "ps",
                            fontWeight: FontWeight.bold,
                            color: AppColors.textcolor1,
                          ),
                        ),
                        Icon(
                          Icons.access_time,
                          size: AppSize.width * 0.055,
                          color: AppColors.textcolor1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: AppSize.height * 0.02),

              // 4. VENUE FIELD
              _buildFieldLabel('Vonus'),
              SizedBox(height: AppSize.height * 0.008),
              Container(
                height: AppSize.height * 0.06,
                padding: EdgeInsets.symmetric(horizontal: AppSize.width * 0.04),
                decoration: _buildInputBoxDecoration(),
                child: TextField(
                  controller: controller.venueController,
                  style: TextStyle(
                    fontSize: AppSize.width * 0.036,
                    fontFamily: "ps",
                    fontWeight: FontWeight.bold,
                    color: AppColors.textcolor1,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.location_on_outlined,
                      size: AppSize.width * 0.055,
                      color: AppColors.textcolor1,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: AppSize.height * 0.015,
                    ),
                  ),
                ),
              ),

              SizedBox(height: AppSize.height * 0.02),

              // 5. PRICE FIELD
              _buildFieldLabel('Price'),
              SizedBox(height: AppSize.height * 0.008),
              Container(
                height: AppSize.height * 0.06,
                padding: EdgeInsets.symmetric(horizontal: AppSize.width * 0.04),
                decoration: _buildInputBoxDecoration(),
                child: TextField(
                  controller: controller.priceController,
                  style: TextStyle(
                    fontSize: AppSize.width * 0.036,
                    fontFamily: "ps",
                    fontWeight: FontWeight.bold,
                    color: AppColors.textcolor1,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: AppSize.height * 0.015,
                    ),
                  ),
                ),
              ),

              SizedBox(height: AppSize.height * 0.02),

              // 6. NUMBERS OF PLAYER NEEDED (COUNTER)
              _buildFieldLabel('Numbers of player needed'),
              SizedBox(height: AppSize.height * 0.008),
              Container(
                height: AppSize.height * 0.06,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.width * 0.015,
                ),
                decoration: _buildInputBoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => controller.decrementPlayer(),
                      child: Container(
                        width: AppSize.width * 0.11,
                        height: AppSize.height * 0.045,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.remove,
                          color: AppColors.textcolor1,
                          size: AppSize.width * 0.05,
                        ),
                      ),
                    ),
                    Obx(
                      () => Text(
                        '${controller.playerCount.value}',
                        style: TextStyle(
                          fontSize: AppSize.width * 0.04,
                          fontFamily: "ps",
                          fontWeight: FontWeight.bold,
                          color: AppColors.textcolor1,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.incrementPlayer(),
                      child: Container(
                        width: AppSize.width * 0.11,
                        height: AppSize.height * 0.045,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.add,
                          color: AppColors.textcolor1,
                          size: AppSize.width * 0.05,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.height * 0.02),

              // 7. GAME NAME FIELD
              _buildFieldLabel('Game'),
              SizedBox(height: AppSize.height * 0.008),
              Container(
                height: AppSize.height * 0.06,
                padding: EdgeInsets.symmetric(horizontal: AppSize.width * 0.04),
                decoration: _buildInputBoxDecoration(),
                child: TextField(
                  controller: controller.gameNameController,
                  style: TextStyle(
                    fontSize: AppSize.width * 0.035,
                    fontFamily: "pr",
                    fontWeight: FontWeight.w500,
                    color: AppColors.textcolor1,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: AppSize.height * 0.015,
                    ),
                  ),
                ),
              ),

              SizedBox(height: AppSize.height * 0.025),

              // 8. RECURRING GAME ROW WITH SWITCH
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildFieldLabel('Recurring Game'),
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

              SizedBox(height: AppSize.height * 0.008),

              // REPEAT DROPDOWN (Shown when isRecurring is true)
              Obx(
                () => controller.isRecurring.value
                    ? Container(
                        height: AppSize.height * 0.06,
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSize.width * 0.04,
                        ),
                        decoration: _buildInputBoxDecoration(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Repeat',
                              style: TextStyle(
                                fontSize: AppSize.width * 0.035,
                                fontFamily: "ps",
                                fontWeight: FontWeight.bold,
                                color: AppColors.textcolor1,
                              ),
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: controller.selectedRepeatOption.value,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.textcolor1,
                                  size: AppSize.width * 0.055,
                                ),
                                items: controller.repeatOptions.map((
                                  String option,
                                ) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(
                                      option,
                                      style: TextStyle(
                                        fontSize: AppSize.width * 0.034,
                                        fontFamily: "pr",
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textcolor1,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  if (val != null)
                                    controller.selectedRepeatOption.value = val;
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ),

              SizedBox(height: AppSize.height * 0.04),

              CustomButton(
                title: "Next",
                textColor: Colors.black,
                onTap: () {
                  Get.to(Setupgame());
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

  // Label Helper Widget
  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: AppSize.width * 0.032,
        fontFamily: "ps",
        fontWeight: FontWeight.bold,
        color: AppColors.textcolor1,
      ),
    );
  }

  // Input Box Outer Decoration
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
