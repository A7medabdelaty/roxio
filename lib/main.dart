import 'package:flutter/material.dart';
import 'package:roxio/services/splash/view/splash_view.dart';

void main() {
  runApp(const RoxioApp());
}

class RoxioApp extends StatelessWidget {
  const RoxioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Roxio',
      home: SplashView(),
    );
  }
}
