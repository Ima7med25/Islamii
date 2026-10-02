import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:islami_app/core/utils/app_colors.dart';

class CustomLoadingApp extends StatelessWidget {
  const CustomLoadingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.fourRotatingDots(
        color: AppColors.goldDarkColor,
        size: 48,
      ),
    );
  }
}
