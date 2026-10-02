import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/core/utils/app_styles.dart';

ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDarkColor,
    scaffoldBackgroundColor: AppColors.scaffoldBgDarkColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.scaffoldBgDarkColor,
      centerTitle: true,
      titleTextStyle: AppStyles.style16SemiBold.copyWith(
        color: AppColors.goldDarkColor,
      ),
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: const IconThemeData(color: AppColors.goldDarkColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppStyles.style10SemiBold.copyWith(color: AppColors.gery600),
      filled: true,
      fillColor: AppColors.blackColor,
      prefixIconColor: AppColors.goldDarkColor,
      suffixIconColor: AppColors.goldDarkColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppConst.kSmallPadding,
        vertical: AppConst.kMediumPadding,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConst.kBorderRadius),
        borderSide: const BorderSide(color: AppColors.goldDarkColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConst.kBorderRadius),
        borderSide: const BorderSide(color: AppColors.goldDarkColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConst.kBorderRadius),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConst.kBorderRadius),
        borderSide: const BorderSide(color: AppColors.goldDarkColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConst.kBorderRadius),
        borderSide: const BorderSide(color: AppColors.goldDarkColor),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.goldDarkColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConst.kBorderRadius),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.goldDarkColor),
        foregroundColor: WidgetStateProperty.all(AppColors.whiteColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConst.kBorderRadius),
          ),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.scaffoldBgDarkColor,
      elevation: 0,
      selectedItemColor: AppColors.goldDarkColor,
      unselectedItemColor: AppColors.gery600,
      selectedIconTheme: IconThemeData(color: AppColors.goldDarkColor),
      unselectedIconTheme: IconThemeData(color: AppColors.gery600),
    ),
  );
}
