import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:roxio/core/utils/styles/text_styles.dart';

import 'home_custom_icon.dart';

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
            ElevatedButton(
              style: ButtonStyle(
                alignment: Alignment.topLeft,
                padding: WidgetStatePropertyAll(
                  EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 25),
                ),
                backgroundColor: WidgetStatePropertyAll(Colors.white),
              ),
              onPressed: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'From: Wilson Terrace 219 W',
                    style: AppTextStyles.text10,
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Icon(
                        FontAwesomeIcons.solidCircle,
                        size: 10,
                        color: Color(0xff1FCD6C),
                      ),
                      Text(
                        'Where to?',
                        style: AppTextStyles.text18.copyWith(
                          color: Color(0xff0D1724),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}
