import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/features/dashboard/data/model/nav_bar_model.dart';
import 'package:islami_app/features/dashboard/presentation/widgets/custom_nav_bar_item.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final Function(int index) onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppConst.kSmallPadding,
        horizontal: AppConst.kSmallPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        color: AppColors.goldDarkColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(
            5,
            (index) => Expanded(
              child: InkWell(
                onTap: () => onTap(index),
                child: CustomNavBarItem(
                  isSelected: currentIndex == index,
                  navBarModel: NavBarModel.navbarItemList[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
