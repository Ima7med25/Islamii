import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_const.dart';

class CustomBottonSheet extends StatelessWidget {
  const CustomBottonSheet({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(AppConst.kDefaultPadding),
        child: IntrinsicHeight(
          child: Column(
            children: [
              Container(
                height: 5.h,
                width: 120,
                decoration: BoxDecoration(
                  color: AppColors.blackColor,
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
              verticalSpace(24),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
