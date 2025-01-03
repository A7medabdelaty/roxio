import 'package:flutter/material.dart';
import 'package:roxio/services/register/view/register_view.dart';
import 'package:roxio/services/splash/view/splash_view.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    SplashView.routeName: (context) => const SplashView(),
    RegisterView.routeName: (context) => const RegisterView(),
  };
}
