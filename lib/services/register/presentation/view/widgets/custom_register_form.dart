import 'package:flutter/material.dart';
import 'package:roxio/core/utils/widgets/custom_button.dart';
import 'package:roxio/core/utils/widgets/custom_title_text.dart';

import 'custom_phone_field.dart';

class CustomRegisterForm extends StatelessWidget {
  const CustomRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTitleText(regularText: 'Welcome to ', boldText: 'Roxio'),
            SizedBox(height: 42),
            CustomPhoneField(),
            SizedBox(height: 24),
            CustomButton(
              buttonText: 'Get Started',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
