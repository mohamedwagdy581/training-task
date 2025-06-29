// onboarding_page_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../onboarding_cubit/onboarding_cubit.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    final pages = [
      _buildPage(
        "assets/images/onboarding1.avif",
        "Discover Products",
        "Find amazing deals",
      ),
      _buildPage(
        "assets/images/onboarding2.avif",
        "Fast Delivery",
        "Get your orders quickly",
      ),
      _buildPage(
        "assets/images/onboarding3.avif",
        "Secure Payments",
        "Shop with confidence",
      ),
    ];

    return PageView.builder(
      controller: controller,
      onPageChanged: (index) =>
          context.read<OnboardingCubit>().changePage(index),
      itemCount: pages.length,
      itemBuilder: (_, index) => pages[index],
    );
  }

  Widget _buildPage(String imagePath, String title, String subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: 250.h),
        SizedBox(height: 32.h),
        Text(
          title,
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.h),
        Text(subtitle, textAlign: TextAlign.center),
      ],
    );
  }
}
