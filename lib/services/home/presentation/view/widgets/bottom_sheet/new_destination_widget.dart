import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:roxio/core/utils/styles/app_colors.dart';
import 'package:roxio/core/utils/styles/text_styles.dart';

class NewDestinationWidget extends StatelessWidget {
  const NewDestinationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Icon(
                FontAwesomeIcons.solidCircle,
                size: 12,
                color: AppColors.primaryColor,
              ),
              SizedBox(
                height: 30,
                child: VerticalDivider(thickness: 2),
              ),
              Icon(
                FontAwesomeIcons.solidCircle,
                size: 12,
                color: Color(0xff1FCD6C),
              ),
            ],
          ),
          Expanded(
            child: Column(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Wilson Terrace 219 W',
                    hintStyle: AppTextStyles.text18,
                  ),
                ),
                Text(
                  'Diana Trail 115 A',
                  style: AppTextStyles.text18.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
