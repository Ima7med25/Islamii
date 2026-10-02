import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/core/widgets/custom_loading_app.dart';
import 'package:islami_app/features/quran/domain/entity/sura_entity/sura_entity.dart';
import 'package:islami_app/features/quran/presentation/cubit/quran_cubit/quran_cubit.dart';
import 'package:islami_app/features/quran/presentation/cubit/setting_cubit/setting_cubit.dart';
import 'package:islami_app/features/quran/presentation/widgets/cusrom_sura_page.dart';
import 'package:islami_app/features/quran/presentation/widgets/custom_bottom_sheet_setting.dart';

class SuraDetailsScreen extends StatelessWidget {
  const SuraDetailsScreen({super.key, required this.suraEntity});
  final SuraEntity suraEntity;

  @override
  Widget build(BuildContext context) {
    List<int?> pages = context.read<QuranCubit>().pages;
    return BlocProvider(
      create: (context) => SettingCubit(),
      child: Scaffold(
        bottomSheet: BlocBuilder<SettingCubit, SettingState>(
          builder: (context, state) {
            if (state is AutomaticAnimationState) {
              return context.read<SettingCubit>().isVisiblBottomSheet
                  ? CustomBottomSheetSetting(
                    numPages: pages.length,
                    surahIndex: suraEntity.number,
                  )
                  : SizedBox.shrink();
            } else {
              return CustomBottomSheetSetting(surahIndex: suraEntity.number);
            }
          },
        ),
        appBar: AppBar(title: Text(suraEntity.name)),
        body: BlocBuilder<QuranCubit, QuranState>(
          buildWhen:
              (previous, current) =>
                  current is GetSuraByIndexSuccess ||
                  current is GetSuraByIndexLoading ||
                  current is GetSuraByIndexError,

          builder: (context, state) {
            if (state is GetSuraByIndexSuccess) {
              final ayahs = state.sura.ayahs ?? [];
              pages = ayahs.map((e) => e.page).toSet().toList()..sort();
              return SingleChildScrollView(
                controller: context.read<SettingCubit>().scrollController,
                child: Column(
                  children: [
                    Text(
                      'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ',
                      style: AppStyles.style16SemiBold,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: pages.length,
                      itemBuilder: (context, index) {
                        return CustomSuraPage(pageNumber: pages[index]!);
                      },
                    ),
                  ],
                ),
              );
            } else {
              return const CustomLoadingApp();
            }
          },
        ),
      ),
    );
  }
}
