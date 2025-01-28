import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_custom_icon.dart';
import 'where_to_button.dart';

class HomeFeaturedButtons extends StatelessWidget {
  const HomeFeaturedButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: HomeCustomIcon(
                icon: FontAwesomeIcons.barsStaggered,
              ),
            ),
            Spacer(),
            Row(
              children: [
                HomeCustomIcon(icon: FontAwesomeIcons.house),
                SizedBox(width: 10),
                HomeCustomIcon(icon: FontAwesomeIcons.clock),
                Spacer(),
                HomeCustomIcon(icon: FontAwesomeIcons.locationCrosshairs),
              ],
            ),
            SizedBox(height: 14),
            WhereToButton(),
            SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}
