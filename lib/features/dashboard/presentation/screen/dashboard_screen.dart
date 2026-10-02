import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/features/dashboard/presentation/widgets/custom_nav_bar.dart';
import 'package:islami_app/features/hadith/presentation/screen/hadith_screen.dart';
import 'package:islami_app/features/pray/presentation/screen/pray_screen.dart';
import 'package:islami_app/features/qibla/presentation/screen/qiblah.dart';
import 'package:islami_app/features/quran/presentation/screen/quran_screen.dart';
import 'package:islami_app/features/sebha/presentation/pages/sebha_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late PersistentTabController _controller;

  final List<CustomNavBarScreen> _screens = [
    CustomNavBarScreen(screen: const QuranScreen()),
    CustomNavBarScreen(screen: const HadithScreen()),
    CustomNavBarScreen(screen: const SebhaScreen()),
    CustomNavBarScreen(screen: const QiblahScreen()),
    CustomNavBarScreen(screen: const PrayScreen()),
  ];

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PersistentTabView.custom(
        context,
        controller: _controller,
        screens: _screens,
        itemCount: _screens.length,
        navBarHeight: 80.h,
        bottomScreenMargin: 0,
        confineToSafeArea: false,
        backgroundColor: Colors.transparent,
        customWidget: CustomNavBar(
          currentIndex: _controller.index,
          onTap: (int index) {
            setState(() {
              _controller.index = index;
            });
          },
        ),
      ),
    );
  }
}
