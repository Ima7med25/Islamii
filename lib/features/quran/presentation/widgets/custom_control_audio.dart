import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/service/audio_services.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/features/quran/domain/entity/sura_audio_entity/audio_detials_entity.dart';

class CustomControlAudio extends StatefulWidget {
  const CustomControlAudio({
    super.key,
    required this.audios,
    required this.initialValue,
  });
  final List<AudioDetialsEntity> audios;
  final int initialValue;
  @override
  State<CustomControlAudio> createState() => _CustomControlAudioState();
}

class _CustomControlAudioState extends State<CustomControlAudio> {
  bool isVolume = true;
  double speed = 1;
  @override
  Widget build(BuildContext context) {
    final audioService = AudioService();
    return StreamBuilder<PlayerState>(
      stream: audioService.onPlayerStateChanged ?? const Stream.empty(),
      initialData: PlayerState.stopped,
      builder: (context, asyncSnapshot) {
        final state = asyncSnapshot.data ?? PlayerState.stopped;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            horizontalSpace(5),
            IconButton(
              onPressed: () async {
                if (isVolume) {
                  await audioService.setVolume(0);
                  isVolume = false;
                  setState(() {});
                } else {
                  await audioService.setVolume(1);
                  isVolume = true;
                  setState(() {});
                }
              },
              icon: Icon(
                isVolume ? Icons.volume_up_rounded : Icons.volume_off_rounded,
              ),
            ),
            IconButton(
              onPressed: () async {
                final currentPosition =
                    await audioService.onPositionChanged!.first;
                final newPosition =
                    currentPosition - const Duration(seconds: 10);
                await audioService.seek(newPosition);
              },
              icon: const Icon(Icons.skip_next_rounded),
            ),
            horizontalSpace(5),
            GestureDetector(
              onTap: () async {
                log('state: $state');
                if (state == PlayerState.playing) {
                  await audioService.pause();
                } else if (state == PlayerState.paused) {
                  await audioService.resume();
                } else if (state == PlayerState.stopped) {
                  await audioService.play(
                    widget.audios[widget.initialValue].originalUrl ?? '',
                  );
                }
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: AppColors.goldDarkColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _getIconForPlayerState(state),
                  color: AppColors.blackColor,
                ),
              ),
            ),
            horizontalSpace(5),
            IconButton(
              onPressed: () async {
                final currentPosition =
                    await audioService.onPositionChanged!.first;
                final newPosition =
                    currentPosition + const Duration(seconds: 10);
                await audioService.seek(newPosition);
              },
              icon: const Icon(Icons.skip_previous_rounded),
            ),
            IconButton(
              onPressed: () async {
                if (speed == 1) {
                  await audioService.setSpeed(1.5);
                  setState(() {
                    speed = 1.5;
                  });
                } else if (speed == 1.5) {
                  await audioService.setSpeed(2);
                  setState(() {
                    speed = 2;
                  });
                } else if (speed == 2) {
                  await audioService.setSpeed(0.5);
                  setState(() {
                    speed = 0.5;
                  });
                } else if (speed == 0.5) {
                  await audioService.setSpeed(1);
                  setState(() {
                    speed = 1;
                  });
                }
              },
              icon: Row(
                children: [
                  const Icon(Icons.speed),
                  horizontalSpace(5),
                  Text('$speed'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  IconData _getIconForPlayerState(PlayerState? state) {
    switch (state) {
      case PlayerState.playing:
        return Icons.pause;
      case PlayerState.paused:
      case PlayerState.stopped:
      default:
        return Icons.play_arrow;
    }
  }
}
