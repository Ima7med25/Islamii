import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/features/hadith/domain/entity/hadith_chapter_details_entity/hadith_details_entitiy.dart';

class HadithDetailsScreen extends StatelessWidget {
  const HadithDetailsScreen({super.key, required this.hadithDetailsEntitiy});
  final HadithDetailsEntitiy hadithDetailsEntitiy;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hadith'.tr(), style: AppStyles.style16SemiBold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConst.kSmallPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppImages.suraDecorationRight),
                  Text(
                    hadithDetailsEntitiy.chapter?.chapterArabic ?? "",
                    style: AppStyles.style16SemiBold.copyWith(
                      color: AppColors.goldDarkColor,
                    ),
                  ),
                  Image.asset(AppImages.suraDecorationLeft),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConst.kMediumPadding,
                ),
                child: Text(
                  hadithDetailsEntitiy.hadithArabic ?? '',
                  style: AppStyles.style16SemiBold.copyWith(
                    color: AppColors.goldDarkColor,
                    height: 1.8,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              verticalSpace(16),
            ],
          ),
        ),
      ),
    );
  }
}
