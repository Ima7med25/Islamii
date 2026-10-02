import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class AzkarItem extends StatelessWidget {
  const AzkarItem({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });
  final String image;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 185 / 259,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: AppConst.kDefaultPadding,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.goldDarkColor),
            color: AppColors.scaffoldBgDarkColor,
          ),
          child: Column(
            children: [
              Expanded(child: Image.asset(image)),
              verticalSpace(10),
              Text(title, style: AppStyles.style20Bold),
            ],
          ),
        ),
      ),
    );
  }
}
