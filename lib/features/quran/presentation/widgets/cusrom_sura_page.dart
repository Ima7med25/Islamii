import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/service/shared_prefs_service.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/core/utils/functions/remove_basmala.dart';
import 'package:islami_app/features/quran/domain/entity/sura_detail_entity/ayah_entity.dart';
import 'package:islami_app/features/quran/presentation/cubit/quran_cubit/quran_cubit.dart';
import 'package:islami_app/features/quran/presentation/cubit/setting_cubit/setting_cubit.dart';

class CustomSuraPage extends StatelessWidget {
  final int pageNumber;
  const CustomSuraPage({super.key, required this.pageNumber});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      buildWhen:
          (previous, current) =>
              current is GetSuraByIndexSuccess ||
              current is GetSuraByIndexLoading ||
              current is GetSuraByIndexError,
      builder: (context, state) {
        final settingCubit = context.read<SettingCubit>();

        if (state is GetSuraByIndexSuccess) {
          List<AyahEntity> ayahs =
              state.sura.ayahs!.where((e) => e.page == pageNumber).toList();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppConst.kDefaultPadding),
                child: StreamBuilder<double>(
                  stream: settingCubit.fontSize.stream,
                  initialData: settingCubit.fontSize.value,
                  builder: (context, asyncSnapshot) {
                    return Text.rich(
                      TextSpan(
                        children:
                            ayahs.map((ayah) {
                              return TextSpan(
                                children: [
                                  TextSpan(
                                    text: removeBasmalah(ayah.text!),
                                    style: AppStyles.style18Regular.copyWith(
                                      fontSize:
                                          SharedPrefsService.getData(
                                            AppConst.kfontSized,
                                          ) ??
                                          asyncSnapshot.data,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " ﴿${ayah.numberInSurah}﴾ ",
                                    style: AppStyles.style16SemiBold.copyWith(
                                      color: AppColors.goldDarkColor,
                                      fontSize:
                                          SharedPrefsService.getData(
                                            AppConst.kfontSized,
                                          ) ??
                                          asyncSnapshot.data,
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                      ),
                      textAlign: TextAlign.justify,
                    );
                  },
                ),
              ),
              Center(
                child: Text("$pageNumber", style: AppStyles.style13SemiBold),
              ),
              const Divider(height: 32, thickness: 4, color: Colors.black),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
