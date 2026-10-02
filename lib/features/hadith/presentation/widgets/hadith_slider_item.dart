import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/features/hadith/domain/entity/hadith_chapter_details_entity/hadith_details_entitiy.dart';
import 'package:islami_app/features/hadith/domain/entity/hadith_entity/hadith_entity.dart';

class HadithSliderItem extends StatelessWidget {
  const HadithSliderItem({
    super.key,
    required this.hadithEntity,
    required this.hadithDetailsEntitiy,
    this.onTap,
  });
  final HadithEntity hadithEntity;
  final HadithDetailsEntitiy hadithDetailsEntitiy;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppConst.kSmallPadding),
        width: MediaQuery.of(context).size.width - 2 * AppConst.kDefaultPadding,
        decoration: BoxDecoration(
          color: AppColors.goldDarkColor,
          borderRadius: BorderRadius.circular(AppConst.kBorderRadius),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            PositionedDirectional(
              bottom: 0,
              start: 0,
              end: 0,
              child: Image.asset(
                AppImages.suraDecorationBottom,
                // ignore: deprecated_member_use
                color: Color(0xff000000).withOpacity(0.5),
              ),
            ),
            PositionedDirectional(
              start: 24,
              end: 24,
              top: 0,
              bottom: 0,
              child: Image.asset(
                AppImages.hadithCardBackGround,
                // ignore: deprecated_member_use
                color: Color(0xff000000).withOpacity(0.5),
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    verticalSpace(AppConst.kSmallPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          AppImages.suraDecorationRight,
                          color: AppColors.blackColor,
                        ),
                        Expanded(
                          child: Text(
                            hadithEntity.chapterArabic ?? '',
                            style: AppStyles.style16Bold.copyWith(
                              color: AppColors.blackColor,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                        Image.asset(
                          AppImages.suraDecorationLeft,
                          color: AppColors.blackColor,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppConst.kSmallPadding,
                          vertical: AppConst.kSmallPadding,
                        ),
                        child: Text(
                          hadithDetailsEntitiy.hadithArabic ?? '',
                          textAlign: TextAlign.justify,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          style: AppStyles.style16SemiBold.copyWith(
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
