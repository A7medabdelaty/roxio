import 'package:flutter/material.dart';

import 'services/register/view/register_view.dart';
import 'services/splash/view/splash_view.dart';

void main() {
  runApp(const RoxioApp());
}

class RoxioApp extends StatelessWidget {
  const RoxioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        RegisterView.routeName: (context) => const RegisterView(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Roxio',
    );
  }
}
