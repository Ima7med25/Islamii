import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCursolSlider extends StatelessWidget {
  const CustomCursolSlider({
    super.key,
    this.items,
    this.height,
    this.aspectRatio,
    this.viewportFraction,
    this.autoPlay,
    this.reverse,
    this.inifinitScroll,
    this.onPageChanged,
  });
  final List<Widget>? items;
  final double? height;
  final double? aspectRatio;
  final double? viewportFraction;
  final bool? autoPlay;
  final bool? reverse;
  final bool? inifinitScroll;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items,
      options: CarouselOptions(
        height: height ?? 128.h,
        aspectRatio: aspectRatio ?? 104 / 128,
        viewportFraction: viewportFraction ?? .3,
        initialPage: 0,
        enableInfiniteScroll: inifinitScroll ?? true,
        reverse: reverse ?? true,
        autoPlay: autoPlay ?? true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        onPageChanged: onPageChanged,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
