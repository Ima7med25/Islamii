import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/service/service_locator.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/core/widgets/custom_loading_app.dart';
import 'package:islami_app/features/pray/domain/repo/azkar_repo.dart';
import 'package:islami_app/features/pray/presentation/cubit/azkar_cubit/azkar_cubit.dart';
import 'package:islami_app/features/pray/presentation/widgets/custom_azkar_navbar.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key, required this.azkarName});
  final String azkarName;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              AzkarCubit(getIt<AzkarRepo>())..getAzkar(azkarName: azkarName),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            azkarName == "azkar_sabah"
                ? 'azkar_morning'.tr()
                : 'azkar_evening'.tr(),
          ),
        ),
        body: BlocConsumer<AzkarCubit, AzkarState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = context.read<AzkarCubit>();
            log(state.toString());
            if (state is AzkarLoading) {
              return CustomLoadingApp();
            } else if (state is AzkarSuccess) {
              return Padding(
                padding: const EdgeInsets.all(AppConst.kDefaultPadding),
                child: Column(
                  children: [
                    Text(
                      '(${state.index + 1} / ${state.azkarEntity.length})',
                      style: AppStyles.style16Bold,
                    ),
                    verticalSpace(32),
                    Expanded(
                      child: PageView.builder(
                        controller: cubit.controller,
                        onPageChanged: (value) {
                          cubit.changeIndex(value);
                        },
                        itemCount: state.azkarEntity.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Text(
                                state.azkarEntity[index].zekr ?? '',
                                style: AppStyles.style16SemiBold.copyWith(
                                  height: 2,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              verticalSpace(32),
                              Text(
                                state.azkarEntity[index].bless ?? '',
                                style: AppStyles.style16SemiBold.copyWith(
                                  height: 2,
                                  color: AppColors.goldDarkColor,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    CustomAzkarNavbar(
                      repeate: state.azkarEntity[state.index].repeat ?? 0,
                      repeatedCount: state.repeate,
                      onTap: () {
                        cubit.repeateAzkar(
                          state.azkarEntity[state.index].repeat ?? 0,
                        );
                      },
                      index: state.index,
                      length: state.azkarEntity.length,
                    ),
                  ],
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
