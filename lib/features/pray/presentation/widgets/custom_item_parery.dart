import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class CustomItemParery extends StatelessWidget {
  const CustomItemParery({
    super.key,
    required this.paryName,
    required this.paryTime,
  });

  final String paryName;
  final String paryTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          stops: [0, 1],
          end: Alignment.bottomRight,
          begin: Alignment.topLeft,
          colors: [AppColors.scaffoldBgDarkColor, Color(0xffB19768)],
        ),
      ),
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(paryName, style: AppStyles.style13SemiBold),
              Text(paryTime, style: AppStyles.style16Bold),
            ],
          ),
        ),
      ),
    );
  }
}
