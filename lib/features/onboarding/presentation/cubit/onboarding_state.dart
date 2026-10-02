part of 'onboarding_cubit.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState(this.currentPage);
  final int currentPage;
  @override
  List<Object> get props => [currentPage];
}

final class OnboardingInitial extends OnboardingState {
  const OnboardingInitial(super.currentPage);
}
