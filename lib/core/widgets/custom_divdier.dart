import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      endIndent: 44,
      indent: 44,
      color: AppColors.whiteColor,
    );
  }
}
