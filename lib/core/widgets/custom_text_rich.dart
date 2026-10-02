import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class CustomTextRich extends StatelessWidget {
  const CustomTextRich({
    super.key,
    required this.text,
    required this.textColor,
    this.onTap,
  });
  final String text;
  final String textColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: text, style: AppStyles.style13SemiBold),
          TextSpan(
            text: textColor,
            style: AppStyles.style13SemiBold.copyWith(
              color: AppColors.goldDarkColor,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
