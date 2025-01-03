import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const routeName = '/';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
    _navigateToRegister();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  void _navigateToRegister() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(
      context,
      '/register',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            'assets/images/splash.png',
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
