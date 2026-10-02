import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/features/sebha/presentation/cubit/sebha_cubit.dart';
import 'package:islami_app/features/sebha/presentation/widgets/custom_sebha.dart';
import 'package:islami_app/features/sebha/presentation/widgets/custom_sebha_slider.dart';

class SebhaBodyScreen extends StatelessWidget {
  const SebhaBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(AppImages.sebhaBg, fit: BoxFit.cover),
        Image.asset(AppImages.shadowBg, fit: BoxFit.cover),
        BlocConsumer<SebhaCubit, SebhaState>(
          listener: (context, state) {},
          builder: (context, state) {
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
                      CustomSebhaSlider(),
                      verticalSpace(20),
                      CustomSebha(),
                      verticalSpace(20),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
