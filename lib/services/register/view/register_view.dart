import 'package:flutter/material.dart';

import 'widgets/custom_register_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static const routeName = 'registerView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Image.asset(
                  'assets/images/recShape.png',
                  fit: BoxFit.fill,
                ),
                SafeArea(
                  child: Image.asset(
                    'assets/images/cab.png',
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                )
              ],
            ),
            CustomRegisterForm(),
          ],
        ),
      ),
    );
  }
}
