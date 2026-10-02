import 'package:easy_localization/easy_localization.dart';
import 'package:islami_app/core/utils/app_images.dart';

class NavBarModel {
  final String lable;
  final String activeIcon;
  final String inActiveIcon;

  const NavBarModel({
    required this.lable,
    required this.activeIcon,
    required this.inActiveIcon,
  });

  static List<NavBarModel> navbarItemList = [
    NavBarModel(
      lable: 'quran'.tr(),
      activeIcon: AppImages.quranBoldIcon,
      inActiveIcon: AppImages.quranDisActiveIcon,
    ),
    NavBarModel(
      lable: 'hadith'.tr(),
      activeIcon: AppImages.hadithActive,
      inActiveIcon: AppImages.hadithDisActive,
    ),
    NavBarModel(
      lable: 'sebha'.tr(),
      activeIcon: AppImages.sebhaActive,
      inActiveIcon: AppImages.sebhaDisActive,
    ),
    NavBarModel(
      lable: 'radio'.tr(),
      activeIcon: AppImages.radioActive,
      inActiveIcon: AppImages.radioDisActive,
    ),
    NavBarModel(
      lable: 'time'.tr(),
      activeIcon: AppImages.timeActive,
      inActiveIcon: AppImages.timeDisActive,
    ),
  ];
}
