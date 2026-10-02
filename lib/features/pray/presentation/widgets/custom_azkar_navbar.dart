import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/core/utils/extention/navigator_extention.dart';
import 'package:islami_app/core/widgets/custom_button.dart';
import 'package:islami_app/features/pray/presentation/cubit/azkar_cubit/azkar_cubit.dart';

class CustomAzkarNavbar extends StatelessWidget {
  const CustomAzkarNavbar({
    super.key,
    required this.repeate,
    required this.repeatedCount,
    this.onTap,
    required this.index,
    required this.length,
  });
  final int repeate;
  final int repeatedCount;
  final void Function()? onTap;
  final int index;
  final int length;
  @override
  Widget build(BuildContext context) {
    double height = 70;
    return Column(
      children: [
        SizedBox(
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${'number_times'.tr()} : $repeate",
                style: AppStyles.style16SemiBold,
              ),
              repeate == 1
                  ? SizedBox.shrink()
                  : GestureDetector(
                    onTap: onTap,
                    child: Container(
                      height: height,
                      width: height,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: AppColors.goldDarkColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          repeatedCount.toString(),
                          style: AppStyles.style16Bold,
                        ),
                      ),
                    ),
                  ),
              Text(
                "${'number_times'.tr()} :$repeate",
                style: AppStyles.style16SemiBold.copyWith(
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
        verticalSpace(24),
        index != length - 1
            ? CustomButton(
              bottom: Text('next'.tr()),
              onPressed: () {
                if (index < length) {
                  context.read<AzkarCubit>().nextPage(length);
                }
              },
            )
            : CustomButton(
              bottom: Text('finsh'.tr()),
              onPressed: () {
                context.pop();
              },
            ),
        verticalSpace(16),
      ],
    );
  }
}
