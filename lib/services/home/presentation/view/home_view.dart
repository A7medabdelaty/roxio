import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roxio/core/utils/location_manager.dart';
import 'package:roxio/services/home/data/repo/home_repo_impl.dart';
import 'package:roxio/services/home/presentation/view/widgets/custom_map.dart';
import 'package:roxio/services/home/presentation/view_model/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = 'homeView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(HomeRepoImpl(LocationManager()))..getCurrentLocation(),
      child: CustomMap(),
    );
  }
}
