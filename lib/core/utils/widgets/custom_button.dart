import 'package:flutter/material.dart';
import 'package:roxio/core/utils/styles/app_colors.dart';
import 'package:roxio/core/utils/styles/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.onPressed, required this.buttonText});

  final void Function() onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColors.primaryColor,
      height: 55,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(45),
      ),
      child: Text(
        buttonText,
        style: AppTextStyles.text18.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
