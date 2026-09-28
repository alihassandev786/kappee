import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kapee/core/widgets/button.dart';
import 'package:kapee/presentation/bottomnavigation/creategame/view/transectionsuccess.dart';

import '../../../../core/constants/appcolors.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../controllers/paymentthroughcontroller.dart';

class Paymentthrough extends StatefulWidget {
  const Paymentthrough({Key? key}) : super(key: key);

  @override
  State<Paymentthrough> createState() => _PaymentthroughState();
}

class _PaymentthroughState extends State<Paymentthrough> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(JoinGameController());

    return Scaffold(
      backgroundColor: AppColors.primary1, // Primary top header color
      body: Stack(
        children: [
          // ==========================================
          // LAYER 1: Header Background (Purple Gradient)
          // ==========================================
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: AppSize.height * 0.28,
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 10,
                left: AppSize.width * 0.04,
                right: AppSize.width * 0.04,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff5125B7), Color(0xFF8700BA)],
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
                      SizedBox(width: AppSize.width * 0.1), // Spacer
                    ],
                  ),
                  SizedBox(height: AppSize.height * 0.005),
                  Text(
                    'Thu, 26 Oct - 8:00 PM',
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
                ],
              ),
            ),
          ),

          // ==========================================
          // LAYER 2: White Sheet Details Card
          // ==========================================
          Positioned.fill(
            top: AppSize.height * 0.22,
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
                    vertical: AppSize.height * 0.03,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Game Fee
                      _buildFeeRow(
                        label: 'Game Fee',
                        amount:
                            '\$${controller.gameFee.value.toStringAsFixed(2)}',
                      ),
                      SizedBox(height: AppSize.height * 0.015),

                      // Service Fee
                      _buildFeeRow(
                        label: 'Kappee Service Fee',
                        amount:
                            '\$${controller.serviceFee.value.toStringAsFixed(2)}',
                      ),
                      SizedBox(height: AppSize.height * 0.02),

                      // Total
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TOTAL',
                            style: TextStyle(
                              fontSize: AppSize.width * 0.04,
                              fontFamily: "ps",
                              fontWeight: FontWeight.bold,
                              color: AppColors.textcolor1,
                            ),
                          ),
                          Text(
                            '\$${controller.totalAmount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: AppSize.width * 0.045,
                              fontFamily: "ps",
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary1,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: AppSize.height * 0.035),

                      // Choose Payment Method Header
                      Text(
                        'Choose Payment method',
                        style: TextStyle(
                          fontSize: AppSize.width * 0.038,
                          fontFamily: "ps",
                          fontWeight: FontWeight.bold,
                          color: AppColors.textcolor1,
                        ),
                      ),

                      SizedBox(height: AppSize.height * 0.015),

                      // Payment Method Options
                      Obx(
                        () => Column(
                          children: [
                            // 1. Pay Now
                            _buildPaymentOption(
                              controller: controller,
                              methodKey: 'Pay Now',
                              title: 'Pay Now',
                              trailingWidget: Text(
                                'PAY\nNOW',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: AppSize.width * 0.026,
                                  fontFamily: "ps",
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary1,
                                  height: 1.0,
                                ),
                              ),
                            ),

                            // 2. Apple Pay
                            _buildPaymentOption(
                              controller: controller,
                              methodKey: 'Apple Pay',
                              title: 'Apple Pay',
                              trailingWidget: Row(
                                children: [
                                  Icon(
                                    Icons.apple,
                                    size: AppSize.width * 0.055,
                                  ),
                                  Text(
                                    'Pay',
                                    style: TextStyle(
                                      fontSize: AppSize.width * 0.04,
                                      fontFamily: "ps",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // 3. Google Pay
                            _buildPaymentOption(
                              controller: controller,
                              methodKey: 'Google Pay',
                              title: 'Google Pay',
                              trailingWidget: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: AppSize.width * 0.04,
                                    fontFamily: "ps",
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: const [
                                    TextSpan(
                                      text: 'G ',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    TextSpan(
                                      text: 'Pay',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // 4. Credit Card
                            _buildPaymentOption(
                              controller: controller,
                              methodKey: 'Credit Card',
                              title: 'Credit Card',
                              trailingWidget: Icon(
                                Icons.credit_card_outlined,
                                color: Colors.black,
                                size: AppSize.width * 0.06,
                              ),
                            ),

                            SizedBox(height: AppSize.height * 0.01),

                            // 5. Pay After the Game
                            _buildPayAfterOption(controller: controller),
                          ],
                        ),
                      ),

                      SizedBox(height: AppSize.height * 0.1),

                      // Pay Button
                      CustomButton(
                        title:
                            "Pay \$${controller.gameFee.value.toStringAsFixed(2)}",
                        leftWidget: Icon(Icons.lock_outline,color: Colors.black,),
                        leftPadding: EdgeInsets.symmetric(horizontal: AppSize.height*0.053),
                        backgroundColor: AppColors.primary3,
                        textColor: Colors.black,
                        onTap: () {
                          Get.to(Transectionsuccess());
                        },
                      ),

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

  // Fee Summary Row Helper
  Widget _buildFeeRow({required String label, required String amount}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: AppSize.width * 0.036,
            fontFamily: "pr",
            color: AppColors.textcolor2,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: AppSize.width * 0.038,
            fontFamily: "ps",
            fontWeight: FontWeight.bold,
            color: AppColors.textcolor1,
          ),
        ),
      ],
    );
  }

  // Payment Option Radio Row Helper
  Widget _buildPaymentOption({
    required JoinGameController controller,
    required String methodKey,
    required String title,
    required Widget trailingWidget,
  }) {
    final bool isSelected = controller.selectedPaymentMethod.value == methodKey;

    return InkWell(
      onTap: () => controller.setPaymentMethod(methodKey),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSize.height * 0.01),
        child: Row(
          children: [
            Container(
              width: AppSize.width * 0.05,
              height: AppSize.width * 0.05,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary1 : Colors.grey.shade400,
                  width: isSelected ? 6 : 1.5,
                ),
                color: isSelected ? Colors.white : Colors.transparent,
              ),
            ),
            SizedBox(width: AppSize.width * 0.035),
            Text(
              title,
              style: TextStyle(
                fontSize: AppSize.width * 0.035,
                fontFamily: "ps",
                fontWeight: FontWeight.w600,
                color: AppColors.textcolor1,
              ),
            ),
            const Spacer(),
            trailingWidget,
          ],
        ),
      ),
    );
  }

  // Pay After Game Option Helper
  Widget _buildPayAfterOption({required JoinGameController controller}) {
    final bool isSelected =
        controller.selectedPaymentMethod.value == 'Pay After the Game';

    return InkWell(
      onTap: () => controller.setPaymentMethod('Pay After the Game'),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSize.height * 0.01),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.monetization_on_outlined,
              size: AppSize.width * 0.06,
              color: Colors.black87,
            ),
            SizedBox(width: AppSize.width * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pay After the Game',
                  style: TextStyle(
                    fontSize: AppSize.width * 0.035,
                    fontFamily: "ps",
                    fontWeight: FontWeight.bold,
                    color: AppColors.textcolor1,
                  ),
                ),
                SizedBox(height: AppSize.height * 0.002),
                Text(
                  'No, payment before',
                  style: TextStyle(
                    fontSize: AppSize.width * 0.03,
                    fontFamily: "pr",
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: AppSize.width * 0.05,
              height: AppSize.width * 0.05,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary1 : Colors.grey.shade400,
                  width: isSelected ? 6 : 1.5,
                ),
                color: isSelected ? Colors.white : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
