import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/routes/routes.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/extention/navigator_extention.dart';
import 'package:islami_app/core/widgets/custom_cursol_slider.dart';
import 'package:islami_app/core/widgets/custom_loading_app.dart';
import 'package:islami_app/features/hadith/domain/entity/hadith_entity/hadith_entity.dart';
import 'package:islami_app/features/hadith/presentation/cubit/hadith_cubit.dart';
import 'package:islami_app/features/hadith/presentation/widgets/hadith_slider_item.dart';

class ListHadithScreen extends StatefulWidget {
  const ListHadithScreen({super.key, required this.hadithEntity});
  final HadithEntity hadithEntity;

  @override
  State<ListHadithScreen> createState() => _ListHadithScreenState();
}

class _ListHadithScreenState extends State<ListHadithScreen> {
  @override
  void initState() {
    context.read<HadithCubit>().getHadithById(
      widget.hadithEntity.chapterNumber ?? '0',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topCenter,
        children: [
          Image.asset(AppImages.hadithBg, fit: BoxFit.fill),
          Image.asset(AppImages.shadowBg, fit: BoxFit.fill),
          LayoutBuilder(
            builder: (builderContext, constraints) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConst.kDefaultPadding,
                  vertical: AppConst.kDefaultPadding,
                ),
                child: Column(
                  children: [
                    verticalSpace(30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Image.asset(AppImages.quranHomeLogo),
                    ),
                    verticalSpace(15),
                    Expanded(
                      child: BlocConsumer<HadithCubit, HadithState>(
                        listener: (context, state) {
                          log(state.toString());
                        },
                        builder: (context, state) {
                          if (state is GetHadithByIdSuccess) {
                            return CustomCursolSlider(
                              items:
                                  state.hadithDetails
                                      .map(
                                        (e) => HadithSliderItem(
                                          onTap: () {
                                            context.pushNamed(
                                              Routes.hadithDetailsScreen,
                                              arguments: e,
                                            );
                                          },
                                          hadithEntity: widget.hadithEntity,
                                          hadithDetailsEntitiy: e,
                                        ),
                                      )
                                      .toList(),
                              viewportFraction: .8,
                              height: double.infinity,
                            );
                          } else if (state is GetHadithByIdLoading) {
                            return CustomLoadingApp();
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                    verticalSpace(30),
                  ],
                ),
              );
            },
          ),
          PositionedDirectional(
            top: 48,
            start: 16,
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.goldDarkColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
