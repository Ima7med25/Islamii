import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/service/shared_prefs_service.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/features/quran/presentation/cubit/setting_cubit/setting_cubit.dart'
    hide ChangeFontSize;

class CustomFontSizeSlider extends StatelessWidget {
  const CustomFontSizeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final settingCubit = context.read<SettingCubit>();
    return StreamBuilder<double>(
      stream: settingCubit.fontSize.stream,
      initialData: settingCubit.fontSize.value,
      builder: (context, snapshot) {
        final value = snapshot.data ?? 22.0;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('fontSize'.tr(), style: AppStyles.style13SemiBold),
            verticalSpace(24),
            Slider(
              padding: EdgeInsets.zero,
              divisions: 32,
              activeColor: AppColors.goldDarkColor,
              inactiveColor: AppColors.gery600,
              max: 32,
              min: 16,
              value: SharedPrefsService.getData(AppConst.kfontSized) ?? value,
              label: value.toString(),
              onChanged: (v) => settingCubit.changeFontSized(v),
            ),
            verticalSpace(16),
          ],
        );
      },
    );
  }
}
