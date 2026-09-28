import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kapee/presentation/bottomnavigation/bottomnavigation/view.dart';

// Project imports based on your structure
import '../../../core/constants/appcolors.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/mediaquery.dart';
import '../../../core/widgets/textfield.dart';
import '../controllers/logincontroller.dart';
import 'signup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Injecting GetX Controller
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColors.background,
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
                'assets/images/logo1.png',
                height: AppSize.height * 0.13,
              ),
              SizedBox(height: AppSize.height * 0.04),

              // 2. Screen Title & Subtitle Section
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: AppSize.width * 0.033,
                  fontFamily: "pr",
                  color: AppColors.textcolor1,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: AppSize.height * 0.002),
              Text(
                'Sign In To Your Account',
                style: TextStyle(
                  fontSize: AppSize.width * 0.055,
                  fontFamily: "ps",
                  fontWeight: FontWeight.bold,
                  color: AppColors.textcolor1,
                ),
              ),

              SizedBox(height: AppSize.height * 0.04),

              // 3. Form Input Fields Section
              CustomTextField(
                controller: controller.emailOrPhoneController,
                hintText: 'Email or Whatsapp Number',
              ),
              SizedBox(height: AppSize.height * 0.01),

              Obx(
                    () => CustomTextField(
                  controller: controller.passwordController,
                  hintText: 'Password',
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

              SizedBox(height: AppSize.height * 0.02),

              // 4. Remember Me Checkbox & Forgot Password Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left Side: Remember Me Checkbox
                  GestureDetector(
                    onTap: () {
                      if (controller.rememberMe != null) {
                        controller.rememberMe!.toggle();
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Obx(() {
                          final isRemember = controller.rememberMe?.value ?? false;
                          return SizedBox(
                            width: AppSize.width * 0.05,
                            height: AppSize.width * 0.05,
                            child: Checkbox(
                              value: isRemember,
                              activeColor: AppColors.primary1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppSize.height*0.03),
                              ),
                              side: BorderSide(
                                color: Colors.grey.shade400,
                                width: 1.5,
                              ),
                              onChanged: (value) {
                                if (controller.rememberMe != null) {
                                  controller.rememberMe!.value = value ?? false;
                                }
                              },
                            ),
                          );
                        }),
                        SizedBox(width: AppSize.width * 0.02),
                        Text(
                          'Remember me',
                          style: TextStyle(
                            fontSize: AppSize.width * 0.032,
                            fontFamily: "pr",
                            color: AppColors.textcolor1,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Right Side: Forgot Password Link
                  GestureDetector(
                    onTap: () {
                      // Forgot Password Navigation
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: AppSize.width * 0.032,
                        fontFamily: "pr",
                        color: AppColors.primary1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSize.height * 0.045),

              // 5. Sign In Button
              CustomButton(
                title: "Sign In",
                onTap: () {
                  Get.to(() => const BottomNavScreen());
                },
              ),

              SizedBox(height: AppSize.height * 0.1),

              // 6. Footer Navigation (Don't have an account? Sign Up)
              const _SignUpFooterRow(),

              SizedBox(height: AppSize.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Extracted Widget: Footer Section for Sign Up
class _SignUpFooterRow extends StatelessWidget {
  const _SignUpFooterRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
            fontSize: AppSize.width * 0.035,
            fontFamily: "pr",
            color: AppColors.textcolor1,
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => const Signup());
          },
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: AppSize.width * 0.035,
              fontFamily: "ps",
              color: AppColors.primary1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}