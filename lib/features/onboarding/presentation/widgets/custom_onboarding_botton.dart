import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/routes/routes.dart';
import 'package:islami_app/core/service/shared_prefs_service.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/core/utils/extention/navigator_extention.dart';
import 'package:islami_app/features/onboarding/data/model/onboarding_model.dart';
import 'package:islami_app/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:islami_app/features/onboarding/presentation/widgets/custom_dot_slider.dart';

class CustomOnboardingBotton extends StatelessWidget {
  const CustomOnboardingBotton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();
    final onboardingList = OnboardingModel.getOnBoardingList();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (cubit.currentPage > 0)
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.transparent),
            ),
            onPressed: cubit.previousPage,
            child: Text(
              'previous'.tr(),
              style: AppStyles.style13SemiBold.copyWith(
                color: AppColors.goldDarkColor,
              ),
            ),
          )
        else
          const SizedBox(width: 64),

        CustomDotSlider(),

        if (cubit.currentPage < onboardingList.length - 1)
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.transparent),
            ),
            onPressed: cubit.nextPage,
            child: Text(
              'next'.tr(),
              style: AppStyles.style13SemiBold.copyWith(
                color: AppColors.goldDarkColor,
              ),
            ),
          )
        else
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.transparent),
            ),
            onPressed: () async {
              context.pushReplacementNamed(Routes.dashboard);
              await SharedPrefsService.setData(AppConst.kFirstTime, true);
            },
            child: Text(
              'finish'.tr(),
              style: AppStyles.style13SemiBold.copyWith(
                color: AppColors.goldDarkColor,
              ),
            ),
          ),
      ],
    );
  }
}
