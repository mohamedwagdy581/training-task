import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/constants/constants.dart';
import '../../../core/storage/cache_helper.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> checkFirstTime() async {
    emit(SplashLoading());

    final isFirstTime = CacheHelper.getBool(key: 'isFirstTime') ?? true;
    final token = CacheHelper.getString(key: kAccessToken);

    await Future.delayed(const Duration(seconds: 2));

    if (isFirstTime) {
      await CacheHelper.saveBool(key: 'isFirstTime', value: false);
      emit(SplashNavigateToOnboarding());
    } else if (token != null && token.isNotEmpty) {
      emit(SplashNavigateToHome());
    } else {
      emit(SplashNavigateToSignin());
    }
  }
}
