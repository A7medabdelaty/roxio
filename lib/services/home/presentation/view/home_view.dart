import 'package:flutter/material.dart';
import 'package:roxio/services/home/presentation/view/widgets/custom_map.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'homeView';
  @override
  Widget build(BuildContext context) {
    return CustomMap();
  }
}
