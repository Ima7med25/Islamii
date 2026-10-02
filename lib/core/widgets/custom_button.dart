import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.bottom,
    required this.onPressed,
    this.color,
    this.width,
    this.height,
    this.radius,
    this.borderColor,
  });
  final Widget bottom;
  final VoidCallback onPressed;
  final Color? color;
  final double? width;
  final double? height;
  final double? radius;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          color ?? AppColors.goldDarkColor,
        ),
        minimumSize: WidgetStateProperty.all(
          Size(width ?? double.infinity, height ?? 54),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 16),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: 1.2,
            ), // Added border
          ),
        ),
      ),
      child: bottom,
    );
  }
}
