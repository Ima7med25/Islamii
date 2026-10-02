import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class OnboardingModel {
  final String image;
  final String title;
  final Widget description;

  const OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });

  static getOnBoardingList() {
    return [
      OnboardingModel(
        image: AppImages.onBoarding1,
        title: "onboarding2_title".tr(),
        description: Text(''),
        //   description: Container(
        //     height: 41.h,
        //     width: 125.w,
        //     decoration: BoxDecoration(
        //       color: Colors.transparent,
        //       border: Border.all(color: AppColors.goldDarkColor, width: 2),
        //       borderRadius: BorderRadius.circular(AppConst.kSmalBorderRadius),
        //     ),
        //     child: BlocBuilder<TranslationsBloc, TranslationsState>(
        //       builder: (context, state) {
        //         return Row(
        //           children: [
        //             Expanded(
        //               child: GestureDetector(
        //                 onTap: () {
        //                   context.read<TranslationsBloc>().add(
        //                     ChangeLocaleEvent(isArabic: true),
        //                   );
        //                   context.setLocale(Locale('ar'));
        //                   log(state.isArabic.toString());
        //                 },
        //                 child: AnimatedContainer(
        //                   clipBehavior: Clip.none,
        //                   curve: Curves.fastOutSlowIn,
        //                   color: !state.isArabic
        //                       ? Colors.transparent
        //                       : AppColors.goldDarkColor,
        //                   height: 41.h,
        //                   foregroundDecoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(
        //                       AppConst.kSmalBorderRadius,
        //                     ),
        //                   ),
        //                   duration: Duration(milliseconds: 100),
        //                   child: Padding(
        //                     padding: const EdgeInsets.all(5),
        //                     child: SvgPicture.asset(AppImages.ar),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //             Expanded(
        //               child: GestureDetector(
        //                 onTap: () {
        //                   context.read<TranslationsBloc>().add(
        //                     ChangeLocaleEvent(isArabic: false),
        //                   );
        //                   context.setLocale(Locale('en'));
        //                   log(state.isArabic.toString());
        //                 },
        //                 child: AnimatedContainer(
        //                   curve: Curves.fastOutSlowIn,
        //                   clipBehavior: Clip.none,
        //                   foregroundDecoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(
        //                       AppConst.kSmalBorderRadius,
        //                     ),
        //                   ),
        //                   height: 41.h,
        //                   duration: Duration(milliseconds: 100),
        //                   color: state.isArabic
        //                       ? Colors.transparent
        //                       : AppColors.goldDarkColor,
        //                   child: Padding(
        //                     padding: const EdgeInsets.all(5.0),
        //                     child: SvgPicture.asset(AppImages.us),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         );
        //       },
        //     ),
        //   ),
        // ),
      ),
      OnboardingModel(
        image: AppImages.onBoarding2,
        title: 'onboarding2_desc'.tr(),
        description: Text(''),
      ),
      OnboardingModel(
        image: AppImages.onBoarding3,
        title: 'onboarding3_title'.tr(),
        description: Text(
          textAlign: TextAlign.center,
          'onboarding3_desc'.tr(),
          style: AppStyles.style13SemiBold.copyWith(
            color: AppColors.goldDarkColor,
          ),
        ),
      ),
      OnboardingModel(
        image: AppImages.onBoarding4,
        title: 'onboarding4_title'.tr(),
        description: Text(
          textAlign: TextAlign.center,
          'onboarding4_desc'.tr(),
          style: AppStyles.style13SemiBold.copyWith(
            color: AppColors.goldDarkColor,
          ),
        ),
      ),
      OnboardingModel(
        image: AppImages.onBoarding5,
        title: 'onboarding5_title'.tr(),
        description: Text(
          textAlign: TextAlign.center,
          'onboarding5_desc'.tr(),
          style: AppStyles.style13SemiBold.copyWith(
            color: AppColors.goldDarkColor,
          ),
        ),
      ),
    ];
  }
}
