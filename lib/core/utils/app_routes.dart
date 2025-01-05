import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roxio/core/utils/services/remote/firebase_auth_service.dart';
import 'package:roxio/services/home/presentation/view/home_view.dart';
import 'package:roxio/services/register/data/repos/register_repo_impl.dart';
import 'package:roxio/services/register/presentation/view/code_verification_view.dart';
import 'package:roxio/services/register/presentation/view/register_view.dart';
import 'package:roxio/services/register/presentation/view_model/register_cubit.dart';
import 'package:roxio/services/splash/view/splash_view.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    SplashView.routeName: (context) => const SplashView(),
    RegisterView.routeName: (context) => const RegisterView(),
    CodeVerificationView.routeName: (context) => BlocProvider(
          create: (context) =>
              RegisterCubit(RegisterRepoImpl(FirebaseAuthService())),
          child: const CodeVerificationView(),
        ),
    HomeView.routeName: (context) => const HomeView(),
  };
}
