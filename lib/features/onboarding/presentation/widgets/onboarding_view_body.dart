// 📁 lib/features/onboarding/view/widgets/onboarding_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/size_config.dart'; // ✅ استدعاء ملف المقاسات
import '../../onboarding_cubit/onboarding_cubit.dart';
import 'create_account_button.dart';
import 'onboarding_item.dart';
import 'onboarding_dot_indecator.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  Future<void> _skipOnBoarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);
    if (context.mounted) {
      context.go(AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // ✅ تهيئة المقاسات
    final cubit = context.read<OnboardingCubit>();

    return Stack(
      children: [
        PageView.builder(
          itemCount: 3,
          onPageChanged: cubit.changePage,
          itemBuilder: (context, index) => OnboardingItem(index: index),
        ),

        // Skip Button
        Positioned(
          top: SizeConfig.scaleHeight(50),
          right: SizeConfig.scaleWidth(20),
          child: TextButton(
            onPressed: () => _skipOnBoarding(context),
            child: const Text(
              "Skip",
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ),
        ),

        // Dots Indicator
        Positioned(
          left: 0,
          right: 0,
          bottom: SizeConfig.scaleHeight(50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => OnboardingDotSIndecator(
                        isActive: cubit.currentPage == index,
                      ),
                    ),
                  );
                },
              ),

              // Create account Button
              const CreateAccountButton(),

              SizedBox(height: SizeConfig.scaleHeight(5)),

              // Already Have An Account TextButton
              TextButton(
                onPressed: () => _skipOnBoarding(context),
                child: const Text(
                  "Already Have An Account",
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
