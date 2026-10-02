import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/core/routes/routes.dart';
import 'package:islami_app/core/translations/bloc/translations_bloc.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/core/utils/extention/navigator_extention.dart';
import 'package:islami_app/features/hadith/domain/entity/hadith_entity/hadith_entity.dart';

class HadithChapterItem extends StatelessWidget {
  const HadithChapterItem({super.key, required this.hadithEntity});
  final HadithEntity hadithEntity;

  @override
  Widget build(BuildContext context) {
    bool isArabic = context.watch<TranslationsBloc>().state.isArabic;
    return ListTile(
      onTap: () {
        context.pushNamed(Routes.hadithScreen, arguments: hadithEntity);
      },
      contentPadding: EdgeInsets.all(0),
      title:
          isArabic
              ? Text(
                hadithEntity.chapterArabic ?? '',
                style: AppStyles.style16Bold,
              )
              : Text(
                hadithEntity.chapterEnglish ?? '',
                style: AppStyles.style16Bold,
                overflow: TextOverflow.ellipsis,
              ),

      trailing: SizedBox(
        width: 80,
        child:
            isArabic
                ? Text(
                  hadithEntity.chapterEnglish ?? '',
                  style: AppStyles.style13SemiBold,
                  overflow: TextOverflow.ellipsis,
                )
                : Text(
                  hadithEntity.chapterArabic ?? '',
                  style: AppStyles.style13SemiBold,
                ),
      ),
      leading: Stack(
        children: [
          SvgPicture.asset(AppImages.suraNumber, width: 48, height: 48),
          PositionedDirectional(
            top: 0,
            bottom: 0,
            end: 0,
            start: 0,
            child: Center(
              child: Text(
                (hadithEntity.chapterNumber).toString(),
                style: AppStyles.style10SemiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
