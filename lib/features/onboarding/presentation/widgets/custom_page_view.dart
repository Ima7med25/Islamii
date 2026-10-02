import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/features/onboarding/data/model/onboarding_model.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.onboardingModel});
  final OnboardingModel onboardingModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 72 - AppConst.kDefaultPadding,
          ),
          child: Image.asset(AppImages.quranHomeLogo),
        ),
        verticalSpace(55),
        Image.asset(onboardingModel.image, height: 341.h, width: 365.w),
        verticalSpace(55),
        Text(
          onboardingModel.title,
          style: AppStyles.style16Bold.copyWith(color: AppColors.goldDarkColor),
        ),
        verticalSpace(25),
        onboardingModel.description,
      ],
    );
  }
}
