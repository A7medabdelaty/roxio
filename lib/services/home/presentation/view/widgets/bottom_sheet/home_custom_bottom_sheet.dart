import 'package:flutter/material.dart';
import 'package:roxio/core/utils/styles/app_colors.dart';
import 'package:roxio/core/utils/widgets/custom_button.dart';
import 'package:roxio/services/home/presentation/view/widgets/bottom_sheet/new_destination_widget.dart';
import 'package:roxio/services/home/presentation/view/widgets/bottom_sheet/recent_destinations_list.dart';

class HomeCustomBottomSheet extends StatelessWidget {
  const HomeCustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1.0,
      minChildSize: 0.5,
      maxChildSize: 1.0,
      expand: true,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 36, vertical: 30),
          alignment: Alignment.topCenter,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              NewDestinationWidget(),
              FractionallySizedBox(
                widthFactor: 1.5,
                child: Divider(
                  color: AppColors.primaryColor.withAlpha(50),
                  thickness: 2,
                ),
              ),
              Expanded(child: RecentDestinationsList()),
              CustomButton(onPressed: () {}, buttonText: 'Done'),
            ],
          ),
        );
      },
    );
  }
}
