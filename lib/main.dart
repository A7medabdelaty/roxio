import 'package:flutter/material.dart';
import 'package:roxio/core/utils/app_routes.dart';

void main() {
  runApp(const RoxioApp());
}

class RoxioApp extends StatelessWidget {
  const RoxioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      title: 'Roxio',
    );
  }
}
