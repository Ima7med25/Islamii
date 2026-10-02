import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/core/widgets/custom_botton_sheet.dart';
import 'package:islami_app/features/quran/presentation/cubit/setting_cubit/setting_cubit.dart';
import 'package:islami_app/features/quran/presentation/widgets/custom_bottom_sheet_botton.dart';
import 'package:islami_app/features/quran/presentation/widgets/custom_font_size_slider.dart';
import 'package:islami_app/features/quran/presentation/widgets/sound_audio_bottom_sheet.dart';

class CustomBottomSheetSetting extends StatelessWidget {
  const CustomBottomSheetSetting({
    super.key,
    this.numPages,
    required this.surahIndex,
  });
  final int? numPages;
  final int surahIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppConst.kSmallPadding),
      height: 74,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomBottomSheetBotton(
            onTap: () {
              final settingCubit = context.read<SettingCubit>();
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder:
                    (context) => IntrinsicHeight(
                      child: BlocProvider.value(
                        value: settingCubit,
                        child: CustomBottonSheet(child: CustomFontSizeSlider()),
                      ),
                    ),
              );
            },
            title: 'fontSize',
            icon: Icons.font_download,
          ),
          CustomBottomSheetBotton(
            onTap: () {
              context.read<SettingCubit>().startAnimatioScroll(numPages ?? 20);
            },
            title: 'AutomaticAnimation',
            icon: Icons.keyboard_double_arrow_down_rounded,
          ),
          CustomBottomSheetBotton(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder:
                    (context) => FractionallySizedBox(
                      heightFactor: 0.4,
                      child: CustomBottonSheet(
                        child: SoundAudioBottomSheet(surahIndex: surahIndex),
                      ),
                    ),
              );
            },
            title: 'soundPlay',
            icon: Icons.play_arrow_rounded,
          ),
        ],
      ),
    );
  }
}
