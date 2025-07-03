import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/banners_cubit/banners_cubit.dart';

class SliderBanners extends StatelessWidget {
  final List<String> bannerImages = [
    'assets/images/onboarding1.png', // استبدل بمسارات صورك الحقيقية
    'assets/images/onboarding2.png',
    'assets/images/onboarding3.png',
  ];

  SliderBanners({super.key});

  @override
  Widget build(BuildContext context) {
    // توفير الـ Cubit للـ Widget tree
    return BlocProvider(
      create: (context) => BannersCubit(totalBanners: bannerImages.length),
      child: Builder(
        builder: (context) {
          final bannerCubit = BlocProvider.of<BannersCubit>(context);
          return Column(
            children: [
              Container(
                height: 150, // ارتفاع البانر
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[200], // لون مؤقت لو مفيش صور
                ),
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: PageView.builder(
                    controller: bannerCubit
                        .pageController, // ربط الـ controller بالـ PageView
                    itemCount: bannerImages.length,
                    onPageChanged: (index) {
                      bannerCubit.changeBanner(
                        index,
                      ); // لما المستخدم يعمل swipe يدوي
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        bannerImages[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // الـ Indicators (النقاط اللي تحت البانر)
              BlocBuilder<BannersCubit, BannersState>(
                builder: (context, state) {
                  int currentIndex = 0;
                  if (state is BannerChanged) {
                    currentIndex = state.currentIndex;
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      bannerImages.length,
                      (index) => buildDot(index, currentIndex),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildDot(int index, int currentIndex) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index
            ? Colors.blue
            : Colors.grey, // لون النقطة النشطة
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
