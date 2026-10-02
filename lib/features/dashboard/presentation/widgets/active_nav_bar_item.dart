import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/features/dashboard/data/model/nav_bar_model.dart';

class ActiveNavBarItem extends StatelessWidget {
  const ActiveNavBarItem({super.key, required this.navBarModel});
  final NavBarModel navBarModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: AppColors.scaffoldBgDarkColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(AppConst.kBorderRadius),
          ),
          child: SvgPicture.asset(
            navBarModel.activeIcon,
            // ignore: deprecated_member_use
            color: AppColors.whiteColor,
            width: 22,
          ),
        ),
        verticalSpace(5),
        Text(navBarModel.lable, style: AppStyles.style13Bold),
      ],
    );
  }
}
