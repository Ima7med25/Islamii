import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/core/widgets/custom_loading_app.dart';
import 'package:islami_app/features/qibla/data/repo/qibla_repo_impl.dart';
import 'package:islami_app/features/qibla/presentation/cubit/qibla_cubit.dart';
import 'package:islami_app/features/qibla/presentation/cubit/qibla_state.dart';

class QiblahScreen extends StatelessWidget {
  const QiblahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QiblaCubit(QiblaRepositoryImpl())..start(),
      child: Scaffold(
        body: BlocBuilder<QiblaCubit, QiblaState>(
          builder: (context, state) {
            if (state is QiblaLoading || state is QiblaInitial) {
              return const Center(child: CustomLoadingApp());
            }
            if (state is QiblaPermissionDenied) {
              return Center(child: Text(state.message));
            }
            if (state is QiblaError) {
              return Center(child: Text('خطأ: ${state.message}'));
            }
            if (state is QiblaReady) {
              final r = state.reading;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.rotate(
                        angle: (r.diff) * 3.1415926535 / 180.0,
                        child: Image.asset(AppImages.compass),
                      ),
                      Positioned(
                        top: 0,
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: 80,
                          color:
                              state.reading.diff.round() <= 1
                                  ? AppColors.goldDarkColor
                                  : AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  r.diff <= 1
                      ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: AppColors.goldDarkColor,
                          ),
                          horizontalSpace(5),
                          Text(
                            '${'face_macca'.tr()}: ${r.diff.round()}°',
                            style: AppStyles.style16Bold,
                          ),
                        ],
                      )
                      : Column(
                        children: [
                          r.diff <= 180
                              ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.rotate_right),
                                  horizontalSpace(5),
                                  Text(
                                    '${'rotate_right'.tr()}: ${r.diff.round()}°',
                                    style: AppStyles.style16Bold,
                                  ),
                                ],
                              )
                              : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.rotate_left),
                                  horizontalSpace(5),
                                  Text(
                                    '${'rotate_left'.tr()}: ${(360.0 - r.diff).round()}°',
                                    style: AppStyles.style16Bold,
                                  ),
                                ],
                              ),
                          const SizedBox(height: 8),
                          Text('${'rotate_about'.tr()} ≈ 0°'),
                        ],
                      ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
