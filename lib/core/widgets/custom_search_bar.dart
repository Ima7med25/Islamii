import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/widgets/custom_text_field.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.hintKey,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
    required this.prefixIcon,
  });
  final String? hintKey;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String prefixIcon;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintKey: hintKey,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      controller: controller,
      prefixIcon: Padding(
        padding: const EdgeInsets.all(12.0),
        // ignore: deprecated_member_use
        child: SvgPicture.asset(prefixIcon, color: AppColors.iconDarkColor),
      ),
    );
  }
}
