import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/widgets/custom_cursol_slider.dart';
import 'package:islami_app/features/sebha/domain/entity/sebha_entity.dart';
import 'package:islami_app/features/sebha/presentation/cubit/sebha_cubit.dart';
import 'package:islami_app/features/sebha/presentation/widgets/custom_slider_sebha_item.dart';

class CustomSebhaSlider extends StatelessWidget {
  const CustomSebhaSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SebhaCubit>();
    return CustomCursolSlider(
      onPageChanged: (p0, p1) {
        cubit.startSebha();
      },
      viewportFraction: 1,
      autoPlay: false,
      reverse: false,
      inifinitScroll: false,
      items: [
        ...List.generate(
          SebhaEntity.getSebha().length,
          (index) => CustomSliderSebhaItem(
            sebhaEntity: SebhaEntity.getSebha()[index],
            index: index,
            length: SebhaEntity.getSebha().length,
          ),
        ),
      ],
    );
  }
}
