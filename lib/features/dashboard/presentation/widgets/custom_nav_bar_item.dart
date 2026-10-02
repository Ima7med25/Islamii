import 'package:flutter/material.dart';
import 'package:islami_app/features/dashboard/data/model/nav_bar_model.dart';
import 'package:islami_app/features/dashboard/presentation/widgets/active_nav_bar_item.dart';
import 'package:islami_app/features/dashboard/presentation/widgets/inactive_nav_bar_item.dart';

class CustomNavBarItem extends StatelessWidget {
  const CustomNavBarItem({
    super.key,
    required this.isSelected,
    required this.navBarModel,
  });
  final bool isSelected;
  final NavBarModel navBarModel;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child:
          isSelected
              ? ActiveNavBarItem(navBarModel: navBarModel)
              : InactiveNavBarItem(navBarModel: navBarModel),
    );
  }
}
