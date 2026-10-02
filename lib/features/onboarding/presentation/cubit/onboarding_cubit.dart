import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_app/features/onboarding/data/model/onboarding_model.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial(0));

  int currentPage = 0;
  PageController pageController = PageController();

  void onPageChanged(int index) {
    currentPage = index;
    emit(OnboardingInitial(index));
  }

  void nextPage() {
    if (currentPage < OnboardingModel.getOnBoardingList().length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }
}
