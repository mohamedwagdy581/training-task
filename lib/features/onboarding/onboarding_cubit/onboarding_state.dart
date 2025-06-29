part of 'onboarding_cubit.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

class OnboardingPageChanged extends OnboardingState {
  final int index;
  OnboardingPageChanged(this.index);
}
