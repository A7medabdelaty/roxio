import 'package:flutter/material.dart';

class HomeCustomIcon extends StatelessWidget {
  const HomeCustomIcon({
    super.key,
    required this.icon,
    this.onPress,
  });

  final IconData icon;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Color(0xffCFD1D3),
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
          color: Colors.white,
        ),
        child: Icon(
          icon,
          size: 20,
        ),
      ),
    );
  }
}
