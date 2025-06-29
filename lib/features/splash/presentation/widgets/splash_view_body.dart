import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors/app_colors.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Store App",
            style: TextStyle(
              fontSize: 40.sp,
              fontWeight: FontWeight.bold,
              color: AppColorScheme.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Any shopping just from home",
            style: TextStyle(fontSize: 16.sp, color: AppColorScheme.white),
          ),
        ],
      ),
    );
  }
}
