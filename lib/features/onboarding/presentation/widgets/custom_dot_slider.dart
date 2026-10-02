import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/features/onboarding/data/model/onboarding_model.dart';
import 'package:islami_app/features/onboarding/presentation/cubit/onboarding_cubit.dart';

class CustomDotSlider extends StatelessWidget {
  const CustomDotSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();
    final onboardingList = OnboardingModel.getOnBoardingList();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        onboardingList.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 5,
          width: cubit.currentPage == index ? 25 : 5,
          decoration: BoxDecoration(
            color:
                cubit.currentPage == index
                    ? AppColors.goldDarkColor
                    : AppColors.gery600,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
