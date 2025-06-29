import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  int currentPage = 0;

  void changePage(int index) {
    currentPage = index;
    emit(OnboardingPageChanged(index));
  }
}
