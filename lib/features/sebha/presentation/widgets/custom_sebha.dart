import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/core/widgets/custom_button.dart';
import 'package:islami_app/features/sebha/presentation/cubit/sebha_cubit.dart';

class CustomSebha extends StatelessWidget {
  const CustomSebha({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SebhaCubit>();
    return Stack(
      children: [
        Image.asset(AppImages.sebha),
        PositionedDirectional(
          top: 80,
          start: 0,
          end: 0,
          bottom: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${cubit.sebhaCount}/33', style: AppStyles.style20Bold),
              verticalSpace(16),
              Text(
                '${'num_of_round'.tr()} : ${cubit.numOfRounds}',
                style: AppStyles.style20Bold,
              ),
              verticalSpace(16),
              CustomButton(
                width: 80,
                bottom: Text('count'.tr(), style: AppStyles.style16Bold),
                onPressed: cubit.changeSebhaCount,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
