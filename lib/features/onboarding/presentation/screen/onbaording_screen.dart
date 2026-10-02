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
import 'package:islami_app/features/onboarding/presentation/widgets/custom_onboarding_botton.dart';
import 'package:islami_app/features/onboarding/presentation/widgets/custom_page_view.dart';

class OnbaordingScreen extends StatelessWidget {
  const OnbaordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConst.kDefaultPadding,
          ),
          child: BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              final cubit = context.read<OnboardingCubit>();
              final onboardingList = OnboardingModel.getOnBoardingList();
              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          onPageChanged: cubit.onPageChanged,
                          controller: cubit.pageController,
                          itemCount: onboardingList.length,
                          itemBuilder: (context, index) {
                            return CustomPageView(
                              onboardingModel: onboardingList[index],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: AppConst.kDefaultPadding),
                      CustomOnboardingBotton(),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      context.pushReplacementNamed(Routes.dashboard);
                      await SharedPrefsService.setData(
                        AppConst.kFirstTime,
                        true,
                      );
                    },
                    child: Text(
                      'skip'.tr(),
                      style: AppStyles.style13SemiBold.copyWith(
                        color: AppColors.goldDarkColor,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
