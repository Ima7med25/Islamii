import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.keyboardType,
    this.obscureText,
    this.controller,
    required this.hintText,
    this.contentPadding,
    this.suffixIcon,
    this.readOnly = false,
    this.borderRaduis,
    this.prefixIcon,
    this.inputBorder,
    this.fillColor,
  });
  final TextInputType keyboardType;
  final bool? obscureText;
  final TextEditingController? controller;
  final String hintText;
  final double? contentPadding;
  final Widget? suffixIcon;
  final bool readOnly;
  final double? borderRaduis;
  final Widget? prefixIcon;
  final InputBorder? inputBorder;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      controller: controller,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "الرجاء ادخال القيمة";
        }
        return null;
      },

      style: AppStyles.style12Regular.copyWith(fontWeight: FontWeight.w600),
      cursorColor: AppColors.goldDarkColor,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: AppStyles.style12Regular.copyWith(color: AppColors.gery600),
        isDense: true,
        hintText: hintText,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        fillColor: fillColor ?? Colors.transparent,
        filled: true,
        enabledBorder:
            inputBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.gery200),
              borderRadius: BorderRadius.circular(borderRaduis ?? 4),
            ),
        focusedBorder:
            inputBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.goldDarkColor),
              borderRadius: BorderRadius.circular(borderRaduis ?? 4),
            ),
        errorBorder:
            inputBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(borderRaduis ?? 4),
            ),
        focusedErrorBorder:
            inputBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(borderRaduis ?? 4),
            ),
      ),
    );
  }
}
