import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/features/dashboard/data/model/nav_bar_model.dart';

class InactiveNavBarItem extends StatelessWidget {
  const InactiveNavBarItem({super.key, required this.navBarModel});
  final NavBarModel navBarModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(navBarModel.inActiveIcon, width: 22),
        verticalSpace(5),
        Text('', style: AppStyles.style13Bold.copyWith(fontSize: 12)),
      ],
    );
  }
}
