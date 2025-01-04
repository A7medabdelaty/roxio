import 'package:flutter/material.dart';
import 'package:roxio/core/utils/styles/text_styles.dart';

class CustomPhoneField extends StatelessWidget {
  const CustomPhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter your phone number';
        } else if (value?.length != 10) {
          return 'Please enter a valid phone number';
        }
        return null;
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
            value: 'egypt',
            items: [
              DropdownMenuItem(
                value: 'egypt',
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
