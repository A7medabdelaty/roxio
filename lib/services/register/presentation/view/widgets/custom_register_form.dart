import 'package:flutter/material.dart';
import 'package:roxio/core/utils/widgets/custom_button.dart';
import 'package:roxio/core/utils/widgets/custom_title_text.dart';
import 'package:roxio/services/register/presentation/view/code_verification_view.dart';

import 'custom_phone_field.dart';

class CustomRegisterForm extends StatelessWidget {
  CustomRegisterForm({super.key});

  final TextEditingController phoneController = TextEditingController();
  static final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTitleText(regularText: 'Welcome to ', boldText: 'Roxio'),
            SizedBox(height: 42),
            CustomPhoneField(
              phoneController: phoneController,
            ),
            SizedBox(height: 24),
            CustomButton(
              buttonText: 'Get Started',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pushReplacementNamed(
                    context,
                    CodeVerificationView.routeName,
                    arguments: phoneController.text,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
