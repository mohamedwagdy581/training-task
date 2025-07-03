import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'banners_state.dart';

class BannersCubit extends Cubit<BannersState> {
  final int totalBanners;
  int _currentIndex = 0;
  Timer? _timer;
  final PageController pageController = PageController();
  BannersCubit({required this.totalBanners}) : super(BannersInitial()) {
    _startAutoScroll();
  }
  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentIndex < totalBanners - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0; // نرجع لأول بانر لما نوصل للآخر
      }
      pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      emit(BannerChanged(_currentIndex));
    });
  }

  void changeBanner(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      emit(BannerChanged(_currentIndex));
      // لو المستخدم عمل scroll يدوي، نعمل reset للـ timer عشان يبدأ العد من جديد
      _timer?.cancel();
      _startAutoScroll();
    }
  }

  // عشان نتأكد إن الـ timer بيتقفل لما الـ Cubit يتعمل له close
  @override
  Future<void> close() {
    _timer?.cancel();
    pageController.dispose();
    return super.close();
  }
}
