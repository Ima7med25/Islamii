import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.prefixIcon,
    this.suffixIcon,
    this.hintKey,
  });
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintKey;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.goldDarkColor,
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        // hint: Text(hintKey ?? ''),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
