import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomCodeVerificationField extends StatelessWidget {
  const CustomCodeVerificationField({
    super.key,
    required this.codeController,
  });

  final TextEditingController codeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.12,
      child: TextFormField(
        controller: codeController,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Please enter the code';
          }
          return null;
        },
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}
