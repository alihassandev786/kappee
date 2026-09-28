import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kapee/core/widgets/button.dart';
import 'package:kapee/presentation/bottomnavigation/creategame/view/playingconfirmation.dart';

import '../../../../core/constants/appcolors.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../controllers/paymentcontroller.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late final PaymentController controller;

  @override
  void initState() {
    super.initState();
    if (Get.isRegistered<PaymentController>()) {
      controller = Get.find<PaymentController>();
    } else {
      controller = Get.put(PaymentController());
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
          'Payments',
          style: TextStyle(
            fontSize: AppSize.width * 0.05,
            fontFamily: "ps",
            fontWeight: FontWeight.bold,
            color: AppColors.textcolor1,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.width * 0.05,
            vertical: AppSize.height * 0.015,
          ),
          child: Column(
            children: [
              // 1. TOTAL COLLECTED GRADIENT CARD
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.width * 0.05,
                  vertical: AppSize.height * 0.027,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF5125B7), // Rich Purple
                      Color(0xFF8700BA), // Light Purple Accent
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF6B2FB9).withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Collected',
                      style: TextStyle(
                        fontSize: AppSize.width * 0.038,
                        fontFamily: "pr",
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    SizedBox(height: AppSize.height * 0.008),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                '\$${controller.totalCollected.value}',
                                style: TextStyle(
                                  fontSize: AppSize.width * 0.08,
                                  fontFamily: "ps",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: AppSize.height * 0.004),
                            Obx(
                              () => Text(
                                '${controller.paidCount.value} / ${controller.unpaidCount.value} / paid',
                                style: TextStyle(
                                  fontSize: AppSize.width * 0.035,
                                  fontFamily: "pr",
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // WITHDRAW BUTTON
                        CustomButton(
                          title: "Withdraw",
                          onTap: () {},
                          width: AppSize.width * 0.3,
                          backgroundColor: AppColors.primary3,
                          borderradius: BorderRadius.circular(
                            AppSize.width * 0.3,
                          ),
                          height: AppSize.height * 0.04,
                          textColor: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.height * 0.04),

              // 2. TAB SWITCHER (Paid / Unpaid)
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => controller.changeTab(0),
                        child: Column(
                          children: [
                            Text(
                              'Paid (${controller.paidUsers.length})',
                              style: TextStyle(
                                fontSize: AppSize.width * 0.038,
                                fontFamily: "ps",
                                fontWeight: FontWeight.bold,
                                color: controller.selectedTabIndex.value == 0
                                    ? const Color(0xFF6B2FB9)
                                    : Colors.grey.shade600,
                              ),
                            ),
                            SizedBox(height: AppSize.height * 0.01),
                            Container(
                              height: 3,
                              color: controller.selectedTabIndex.value == 0
                                  ? const Color(0xFF6B2FB9)
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => controller.changeTab(1),
                        child: Column(
                          children: [
                            Text(
                              'Unpaid',
                              style: TextStyle(
                                fontSize: AppSize.width * 0.038,
                                fontFamily: "ps",
                                fontWeight: FontWeight.bold,
                                color: controller.selectedTabIndex.value == 1
                                    ? const Color(0xFF6B2FB9)
                                    : Colors.grey.shade600,
                              ),
                            ),
                            SizedBox(height: AppSize.height * 0.01),
                            Container(
                              height: 3,
                              color: controller.selectedTabIndex.value == 1
                                  ? const Color(0xFF6B2FB9)
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Divider(height: 1, thickness: 1, color: Colors.grey.shade200),

              SizedBox(height: AppSize.height * 0.03),

              // 3. PAYMENT USER LIST
              Obx(() {
                final currentList = controller.selectedTabIndex.value == 0
                    ? controller.paidUsers
                    : controller.unpaidUsers;

                if (currentList.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.only(top: AppSize.height * 0.05),
                    child: Text(
                      'No records found.',
                      style: TextStyle(
                        fontSize: AppSize.width * 0.035,
                        fontFamily: "pr",
                        color: Colors.grey,
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: currentList.length,
                  itemBuilder: (context, index) {
                    final item = currentList[index];
                    return _buildPaymentTile(
                      name: item['name'],
                      status: item['status'],
                      dateTime: item['dateTime'],
                      avatar: item['avatar'],
                    );
                  },
                );
              }),

              SizedBox(height: AppSize.height * 0.015),

              // 4. VIEW ALL BUTTON
              TextButton(
                onPressed: () {
                  Get.to(Playingconfirmation());
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    fontSize: AppSize.width * 0.038,
                    fontFamily: "ps",
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF6B2FB9),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Payment Single Item Tile
  Widget _buildPaymentTile({
    required String name,
    required String status,
    required String dateTime,
    required String avatar,
  }) {
    final bool isPaid = status.toLowerCase() == 'paid';

    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSize.height * 0.012),
      child: Row(
        children: [
          // User Avatar
          CircleAvatar(
            radius: AppSize.width * 0.058,
            backgroundColor: Colors.grey.shade300,
            backgroundImage: AssetImage(avatar),
            child: avatar.isEmpty
                ? const Icon(Icons.person, color: Colors.white)
                : null,
          ),

          SizedBox(width: AppSize.width * 0.035),

          // User Name
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontSize: AppSize.width * 0.038,
                fontFamily: "ps",
                fontWeight: FontWeight.bold,
                color: AppColors.textcolor1,
              ),
            ),
          ),

          // Status Badge (Paid / Unpaid)
          Text(
            status,
            style: TextStyle(
              fontSize: AppSize.width * 0.033,
              fontFamily: "ps",
              fontWeight: FontWeight.w600,
              color: isPaid ? const Color(0xFF4CAF50) : Colors.red,
            ),
          ),

          SizedBox(width: AppSize.width * 0.05),

          // Date & Time Text
          Text(
            dateTime,
            style: TextStyle(
              fontSize: AppSize.width * 0.031,
              fontFamily: "pr",
              color: AppColors.textcolor2.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
