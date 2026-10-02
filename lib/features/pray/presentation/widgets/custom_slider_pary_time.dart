import 'package:flutter/material.dart';
import 'package:islami_app/core/widgets/custom_cursol_slider.dart';
import 'package:islami_app/features/pray/domain/entitiy/pray_entity/pray_entity.dart';
import 'package:islami_app/features/pray/presentation/widgets/custom_item_parery.dart';

class CustomSliderParyTime extends StatelessWidget {
  const CustomSliderParyTime({super.key, required this.prayEntity});
  final PrayEntity prayEntity;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomCursolSlider(
        items: [
          CustomItemParery(
            paryName: 'الفجر',
            paryTime: prayEntity.timingEntity.fajr ?? '',
          ),
          CustomItemParery(
            paryName: 'الضهر',
            paryTime: prayEntity.timingEntity.dhuhr ?? '',
          ),
          CustomItemParery(
            paryName: 'العصر',
            paryTime: prayEntity.timingEntity.asr ?? '',
          ),
          CustomItemParery(
            paryName: 'المغرب',
            paryTime: prayEntity.timingEntity.maghrib ?? '',
          ),
          CustomItemParery(
            paryName: 'العشاء',
            paryTime: prayEntity.timingEntity.isha ?? '',
          ),
        ],
      ),
    );
  }
}
