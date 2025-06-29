// 📁 lib/features/onboarding/view/widgets/onboarding_item.dart
import 'package:flutter/material.dart';
import '../../../../core/utils/size_config.dart';

class OnboardingItem extends StatelessWidget {
  final int index;
  const OnboardingItem({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final images = ["onboarding1.png", "onboarding2.png", "onboarding3.png"];
    final titles = [
      "Various Collections Of The Latest Products",
      "Complete Collection Of Colors And Sizes",
      "Find The Most Suitable Product For You",
    ];
    final descriptions = [
      "Your favorite items all in one place.",
      "Enjoy a seamless shopping experience.",
      "Get your orders in no time.",
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20)),
      child: Column(
        children: [
          const Spacer(flex: 2),

          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              "assets/images/${images[index]}",
              height: SizeConfig.scaleHeight(300), // ✅ ارتفاع نسبي
              fit: BoxFit.contain,
            ),
          ),

          const Spacer(flex: 1),

          Text(titles[index], style: Theme.of(context).textTheme.titleLarge),

          SizedBox(height: SizeConfig.scaleHeight(10)),

          Text(
            descriptions[index],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),

          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
