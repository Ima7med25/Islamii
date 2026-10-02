import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/widgets/custom_divdier.dart';
import 'package:islami_app/core/widgets/custom_loading_app.dart';
import 'package:islami_app/core/widgets/custom_search_bar.dart';
import 'package:islami_app/features/hadith/presentation/cubit/hadith_cubit.dart';
import 'package:islami_app/features/hadith/presentation/widgets/hadith_chapter_item.dart';

class HadithScreenBody extends StatelessWidget {
  const HadithScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.topCenter,
          children: [
            Image.asset(AppImages.hadithBg, fit: BoxFit.fill),
            Image.asset(AppImages.shadowBg, fit: BoxFit.fill),
            BlocConsumer<HadithCubit, HadithState>(
              buildWhen: (previous, current) {
                return current is GetAllHadithSuccess ||
                    current is GetAllHadithLoading ||
                    current is GetAllHadithError;
              },
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = context.read<HadithCubit>();
                if (state is GetAllHadithSuccess) {
                  return LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints consrains) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppConst.kDefaultPadding,
                          vertical: AppConst.kDefaultPadding,
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
                              controller: cubit.hadithController,
                              hintKey: 'hadith_name'.tr(),
                              onChanged: (val) {
                                cubit.getAllHadith();
                              },
                              prefixIcon: AppImages.hadithActive,
                            ),
                            verticalSpace(20),
                            Expanded(
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return HadithChapterItem(
                                    hadithEntity: state.hadiths[index],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return CustomDivider();
                                },
                                itemCount: state.hadiths.length,
                              ),
                            ),
                            verticalSpace(40),
                          ],
                        ),
                      );
                    },
                  );
                } else if (state is GetAllHadithLoading) {
                  return CustomLoadingApp();
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
