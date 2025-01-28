import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:roxio/core/utils/styles/app_colors.dart';
import 'package:roxio/core/utils/styles/text_styles.dart';

class RecentDestinationsList extends StatelessWidget {
  const RecentDestinationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Row(
            spacing: 14,
            children: [
              Icon(
                index == 0 ? FontAwesomeIcons.house : FontAwesomeIcons.clock,
                size: 20,
                color: AppColors.primaryColor,
              ),
              Text(
                'Home',
                style: AppTextStyles.text18
                    .copyWith(color: AppColors.primaryColor),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Divider(),
        ),
        itemCount: 10,
      ),
    );
  }
}
