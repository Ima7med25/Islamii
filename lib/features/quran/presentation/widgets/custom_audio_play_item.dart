import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:islami_app/core/service/audio_services.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/features/quran/domain/entity/sura_audio_entity/audio_detials_entity.dart';
import 'package:islami_app/features/quran/presentation/widgets/custom_audio_slider.dart';
import 'package:islami_app/features/quran/presentation/widgets/custom_control_audio.dart';

class CustomAudioPlayItem extends StatefulWidget {
  const CustomAudioPlayItem({
    super.key,
    required this.audios,
    required this.suraIndex,
  });
  final List<AudioDetialsEntity> audios;
  final int suraIndex;

  @override
  State<CustomAudioPlayItem> createState() => _CustomAudioPlayItemState();
}

class _CustomAudioPlayItemState extends State<CustomAudioPlayItem> {
  int initialValue = 1;
  @override
  Widget build(BuildContext context) {
    final audioService = AudioService();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          DropdownMenu(
            initialSelection: 0,
            onSelected: (value) {
              setState(() {
                initialValue = value!;
                log(widget.audios[value].reciter!);
              });
              audioService.stop();
            },
            dropdownMenuEntries: List.generate(
              widget.audios.length,
              (index) => DropdownMenuEntry(
                value: index,
                label: widget.audios[index].reciter ?? '',
              ),
            ),
          ),
          verticalSpace(16),
          CustomControlAudio(audios: widget.audios, initialValue: initialValue),
          CustomAudioSlider(),
        ],
      ),
    );
  }
}
