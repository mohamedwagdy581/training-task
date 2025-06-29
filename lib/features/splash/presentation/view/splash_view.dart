import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../splash_cubit/splash_cubit.dart';
import '../widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..checkFirstTime(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigateToOnboarding) {
            context.go(AppRoutes.onboarding);
          } else if (state is SplashNavigateToSignin) {
            context.go(AppRoutes.login);
          } else if (state is SplashNavigateToHome) {
            context.go(AppRoutes.home);
          }
        },
        child: const Scaffold(
          backgroundColor: Colors.blue,
          body: SplashViewBody(),
        ),
      ),
    );
  }
}
