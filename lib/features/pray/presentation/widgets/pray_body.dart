import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/routes/routes.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/core/utils/extention/navigator_extention.dart';
import 'package:islami_app/core/widgets/custom_loading_app.dart';
import 'package:islami_app/features/pray/presentation/cubit/pray_cubit/pray_cubit.dart';
import 'package:islami_app/features/pray/presentation/cubit/pray_cubit/pray_state.dart';
import 'package:islami_app/features/pray/presentation/widgets/azkar_item.dart';
import 'package:islami_app/features/pray/presentation/widgets/custom_slider_pary_time.dart';

class PrayBody extends StatelessWidget {
  const PrayBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PrayCubit, PrayState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is PraySuccess) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConst.kDefaultPadding,
                ),
                child: Column(
                  children: [
                    verticalSpace(30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Image.asset(AppImages.quranHomeLogo),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.brownColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      height: 301.h,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(AppImages.timeBg, fit: BoxFit.fill),
                          PositionedDirectional(
                            top: 25.h,
                            start: 25.w,
                            child: Text(
                              state.prayEntity.dataInfoEntity.hijri!.date ?? '',
                              style: AppStyles.style13SemiBold,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          PositionedDirectional(
                            top: 25.h,
                            end: 25.w,
                            child: Text(
                              state.prayEntity.dataInfoEntity.gregorian!.date ??
                                  '',
                              style: AppStyles.style13SemiBold,
                              textAlign: TextAlign.end,
                            ),
                          ),
                          PositionedDirectional(
                            top: 14.h,
                            start: 0,
                            end: 0,
                            child: Column(
                              children: [
                                Text(
                                  'وقت الصلاة',
                                  style: AppStyles.style16Bold.copyWith(
                                    color: AppColors.scaffoldBgDarkColor
                                    // ignore: deprecated_member_use
                                    .withOpacity(0.7),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  state
                                          .prayEntity
                                          .dataInfoEntity
                                          .hijri!
                                          .weekday!
                                          .ar ??
                                      '',
                                  style: AppStyles.style20Bold.copyWith(
                                    color: AppColors.scaffoldBgDarkColor
                                    // ignore: deprecated_member_use
                                    .withOpacity(0.9),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          PositionedDirectional(
                            top: 104.h,
                            start: 0,
                            end: 0,
                            child: CustomSliderParyTime(
                              prayEntity: state.prayEntity,
                            ),
                          ),
                          PositionedDirectional(
                            bottom: 16,
                            start: 16,
                            end: 16,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${'next_prayer'.tr()} ${state.nextPrayerName}: ${DateFormat('HH:mm').format(state.nextPrayerTime)}',
                                  style: AppStyles.style13SemiBold.copyWith(
                                    color: AppColors.scaffoldBgDarkColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          'alazkar'.tr(),
                          style: AppStyles.style20Bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 240.h,
                      child: Row(
                        children: [
                          Expanded(
                            child: AzkarItem(
                              onTap: () {
                                context.pushNamed(
                                  Routes.azkar,
                                  arguments: "azkar_sabah",
                                );
                              },
                              image: AppImages.morningAzkar,
                              title: 'azkar_morning'.tr(),
                            ),
                          ),
                          horizontalSpace(20),
                          Expanded(
                            child: AzkarItem(
                              onTap: () {
                                context.pushNamed(
                                  Routes.azkar,
                                  arguments: "azkar_massa",
                                );
                              },
                              image: AppImages.eveningAzkar,
                              title: 'azkar_evening'.tr(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else if (state is PrayLoading) {
          return CustomLoadingApp();
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
