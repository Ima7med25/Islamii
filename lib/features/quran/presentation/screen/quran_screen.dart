import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/core/widgets/custom_divdier.dart';
import 'package:islami_app/core/widgets/custom_loading_app.dart';
import 'package:islami_app/core/widgets/custom_search_bar.dart';
import 'package:islami_app/features/quran/domain/entity/sura_entity/sura_entity.dart';
import 'package:islami_app/features/quran/presentation/cubit/quran_cubit/quran_cubit.dart';
import 'package:islami_app/features/quran/presentation/widgets/custom_sura_item.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(AppImages.quranBg, fit: BoxFit.cover),
            Image.asset(AppImages.shadowBg, fit: BoxFit.cover),
            BlocConsumer<QuranCubit, QuranState>(
              buildWhen: (previous, current) {
                return current is GetAllSuraSuccess ||
                    current is GetAllSuraLoading ||
                    current is GetAllSuraError;
              },
              listener: (context, state) {},
              builder: (context, state) {
                if (state is GetAllSuraLoading) {
                  return CustomLoadingApp();
                } else if (state is GetAllSuraSuccess) {
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                              ),
                              child: Image.asset(AppImages.quranHomeLogo),
                            ),
                            CustomSearchBar(
                              controller:
                                  context.read<QuranCubit>().searchController,
                              hintKey: 'sura_name'.tr(),
                              onChanged: (p0) {
                                context.read<QuranCubit>().getAllSura();
                              },
                              prefixIcon: AppImages.quranBoldIcon,
                            ),
                            verticalSpace(20),
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                'surah_list'.tr(),
                                style: AppStyles.style16Bold,
                              ),
                            ),
                            verticalSpace(10),
                            Expanded(
                              child: ListView.separated(
                                itemBuilder:
                                    (context, index) => CustomSuraItem(
                                      suraEntity: SuraEntity(
                                        number: state.suras[index].number,
                                        name: state.suras[index].name,
                                        englishName:
                                            state.suras[index].englishName,
                                        numberOfAyahs:
                                            state.suras[index].numberOfAyahs,
                                      ),
                                    ),
                                separatorBuilder:
                                    (context, index) => CustomDivider(),
                                itemCount: state.suras.length,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
