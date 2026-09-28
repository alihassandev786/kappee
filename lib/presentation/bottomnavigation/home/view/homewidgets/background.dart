import 'package:flutter/material.dart';
import 'package:kapee/core/constants/appcolors.dart';

class Background extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const Background({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,

      decoration:  BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,

          colors: [
            AppColors.primary1, // Dark Purple Top
            AppColors.primary1.withOpacity(0.3), // Dark Purple Top
            AppColors.background// , // White Bottom
          ],

          stops: [
            0.3,
            0.5,
            0.7,
          ],
        ),
      ),

      child: SafeArea(
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}