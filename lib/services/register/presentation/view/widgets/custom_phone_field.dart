import 'package:flutter/material.dart';
import 'package:roxio/core/utils/styles/text_styles.dart';
import 'package:roxio/services/register/presentation/view/code_verification_view.dart';

class CustomPhoneField extends StatelessWidget {
  const CustomPhoneField({super.key, required this.phoneController});

  final TextEditingController phoneController;
  final String dropdownValue = '+20';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter your phone number';
        } else if (value?.length != 10) {
          return 'Please enter a valid phone number';
        }
        phoneController.text = '$dropdownValue${phoneController.text}';
        return null;
      },
      onFieldSubmitted: (value) {
        if (value.length == 10) {
          Navigator.pushReplacementNamed(
            context,
            CodeVerificationView.routeName,
            arguments: '$dropdownValue${phoneController.text}',
          );
        }
        phoneController.text = value;
      },
      decoration: InputDecoration(
        hintText: '1234567891',
        hintStyle: AppTextStyles.text18,
        border: customFieldBorder(),
        enabledBorder: customFieldBorder(),
        focusedBorder: customFieldBorder(),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(start: 24),
          child: DropdownButton(
            value: dropdownValue,
            items: [
              DropdownMenuItem(
                value: dropdownValue,
                child: Text('+20'),
              ),
            ],
            onChanged: (value) {},
          ),
        ),
      ),
      maxLength: 10,
    );
  }

  OutlineInputBorder customFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(45),
      borderSide: BorderSide(color: Color(0xffCFD1D3)),
    );
  }
}
