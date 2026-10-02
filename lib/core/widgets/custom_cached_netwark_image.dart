import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CustomCachedNetwarkImage extends StatelessWidget {
  const CustomCachedNetwarkImage({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: AppColors.gery200,
          highlightColor: AppColors.gery200,
          child: Container(),
        );
      },
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
