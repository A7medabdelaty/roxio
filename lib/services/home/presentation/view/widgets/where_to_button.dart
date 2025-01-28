import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:roxio/core/utils/styles/text_styles.dart';

import 'bottom_sheet/home_custom_bottom_sheet.dart';

class WhereToButton extends StatelessWidget {
  const WhereToButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        alignment: Alignment.topLeft,
        padding: WidgetStatePropertyAll(
          EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 25),
        ),
        backgroundColor: WidgetStatePropertyAll(Colors.white),
      ),
      onPressed: () {
        _showBottomSheet(context);
      },
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
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return HomeCustomBottomSheet();
      },
    );
  }
}
