import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/core/routes/routes.dart';
import 'package:islami_app/core/translations/bloc/translations_bloc.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/core/utils/extention/navigator_extention.dart';
import 'package:islami_app/features/quran/domain/entity/sura_entity/sura_entity.dart';

class CustomSuraItem extends StatelessWidget {
  const CustomSuraItem({super.key, required this.suraEntity});
  final SuraEntity suraEntity;

  @override
  Widget build(BuildContext context) {
    bool isArabic = context.watch<TranslationsBloc>().state.isArabic;
    return ListTile(
      onTap: () {
        context.pushNamed(
          Routes.sura,
          arguments: {'suraEntity': suraEntity, 'index': suraEntity.number},
        );
      },
      contentPadding: EdgeInsets.all(0),
      title:
          isArabic
              ? Text(suraEntity.name, style: AppStyles.style16Bold)
              : Text(suraEntity.englishName, style: AppStyles.style16Bold),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Row(
          children: [
            Text(
              '${suraEntity.numberOfAyahs}',
              style: AppStyles.style13SemiBold,
            ),
            const SizedBox(width: 5),
            Text('verses'.tr(), style: AppStyles.style13SemiBold),
          ],
        ),
      ),
      trailing:
          isArabic
              ? Text(suraEntity.englishName, style: AppStyles.style16Bold)
              : Text(suraEntity.name, style: AppStyles.style16Bold),
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
                (suraEntity.number).toString(),
                style: AppStyles.style10SemiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
