import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/features/sebha/domain/entity/sebha_entity.dart';

class CustomSliderSebhaItem extends StatelessWidget {
  const CustomSliderSebhaItem({
    super.key,
    required this.sebhaEntity,
    required this.index,
    required this.length,
  });
  final SebhaEntity sebhaEntity;
  final int index;
  final int length;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          padding: const EdgeInsets.all(AppConst.kSmallPadding),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.goldDarkColor,
            borderRadius: BorderRadius.circular(AppConst.kBorderRadius),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: index != 0,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_left,
                      color: AppColors.blackColor,
                      size: 32,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    sebhaEntity.text,
                    maxLines: 5,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.style20Bold.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
                Visibility(
                  visible: index != length - 1,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_right,
                      color: AppColors.blackColor,
                      size: 32,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        PositionedDirectional(
          bottom: 0,
          start: 0,
          end: 0,
          child: Image.asset(
            AppImages.suraDecorationBottom,
            fit: BoxFit.cover,
            // ignore: deprecated_member_use
            color: AppColors.blackColor.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
