import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Project imports based on your structure
import '../../../core/constants/appcolors.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/mediaquery.dart';
import '../../../core/widgets/textfield.dart';
import '../controllers/signupcontroller.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    // Injecting GetX Controller
    final SignupController controller = Get.put(SignupController());

    return Scaffold(
      backgroundColor: AppColors.background, // Standard white background
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.width * 0.06,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: AppSize.height * 0.04),

              // 1. App Logo Header Section
              Image.asset(
                'assets/images/logo1.png', // Aapki logo image asset path
                height: AppSize.height * 0.13,
              ),
              SizedBox(height: AppSize.height * 0.03),

              // 2. Screen Title & Subtitle Section
              Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: AppSize.width * 0.033,
                  fontFamily: "pr",
                  color: AppColors.textcolor1,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: AppSize.height * 0.002),
              Text(
                'Create Your Account',
                style: TextStyle(
                  fontSize: AppSize.width * 0.055,
                  fontFamily: "ps",
                  fontWeight: FontWeight.bold,
                  color: AppColors.textcolor1,
                ),
              ),

              SizedBox(height: AppSize.height * 0.035),

              // 3. Form Input Fields Section
              CustomTextField(
                controller: controller.userNameController,
                hintText: 'User Name',
              ),
              SizedBox(height: AppSize.height * 0.01),

              CustomTextField(
                controller: controller.whatsappNumberController,
                hintText: 'Whatsapp Number',
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: AppSize.height * 0.01),

              Obx(
                    () => CustomTextField(
                  controller: controller.createPasswordController,
                  hintText: 'Create Password',
                  obscureText: !controller.isPasswordVisible.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off_outlined,
                      color: AppColors.primary1,
                    ),
                    onPressed: () => controller.togglePasswordVisibility(),
                  ),
                ),
              ),
              SizedBox(height: AppSize.height * 0.01),

              Obx(
                    () => CustomTextField(
                  controller: controller.confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: !controller.isConfirmPasswordVisible.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isConfirmPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off_outlined,
                      color: AppColors.primary1,
                    ),
                    onPressed: () => controller.toggleConfirmPasswordVisibility(),
                  ),
                ),
              ),

              SizedBox(height: AppSize.height * 0.02),

              // 4. Terms & Conditions Checkbox Row
              const _TermsAndConditionsRow(),

              SizedBox(height: AppSize.height * 0.045),

              // 5. Sign Up Button
              CustomButton(title: "Sign Up", onTap: (){
                Get.to(Login());
              }),

              SizedBox(height: AppSize.height * 0.08),

              // 6. Footer Navigation (Already have an account? Sign In)
              const _SignInFooterRow(),

              SizedBox(height: AppSize.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}



// Custom Extracted Widget: Terms & Conditions Checkbox Row
class _TermsAndConditionsRow extends StatelessWidget {
  const _TermsAndConditionsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.find<SignupController>();

    return Row(
      children: [
        Obx(
              () => SizedBox(
            height: 26,
            width: 26,
            child: Checkbox(
              value: controller.isTermsAccepted.value,
              activeColor: AppColors.primary1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onChanged: (val) => controller.toggleTerms(val),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'I agree with ',
              style: TextStyle(
                color: AppColors.textcolor1,
                fontSize: AppSize.width * 0.032,
              ),
              children: [
                TextSpan(
                  text: 'terms & conditions',
                  style: TextStyle(
                    color: AppColors.primary1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' & ',
                  style: TextStyle(color: AppColors.textcolor1),
                ),
                TextSpan(
                  text: 'privacy policy',
                  style: TextStyle(
                    color: AppColors.primary1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Custom Extracted Widget: Footer Section for Sign In
class _SignInFooterRow extends StatelessWidget {
  const _SignInFooterRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyle(
            fontSize: AppSize.width * 0.035,
            color: AppColors.textcolor1,
          ),
        ),
        GestureDetector(
          onTap: () {
             Get.to(() => const Login());
          },
          child: Text(
            'Sign In',
            style: TextStyle(
              fontSize: AppSize.width * 0.035,
              color: AppColors.primary1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}