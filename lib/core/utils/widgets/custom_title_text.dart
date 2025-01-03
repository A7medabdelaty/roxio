import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class CustomTitleText extends StatelessWidget {
  const CustomTitleText({
    super.key,
    required this.regularText,
    required this.boldText,
  });

  final dynamic regularText;
  final dynamic boldText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: regularText,
          ),
          TextSpan(
            text: boldText,
            style: AppTextStyles.text30.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
        style: AppTextStyles.text30,
      ),
    );
  }
}
