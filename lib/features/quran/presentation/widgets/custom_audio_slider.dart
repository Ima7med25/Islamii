import 'package:flutter/material.dart';
import 'package:islami_app/core/service/audio_services.dart';
import 'package:islami_app/core/utils/app_colors.dart';

class CustomAudioSlider extends StatelessWidget {
  const CustomAudioSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final audioService = AudioService();
    return StreamBuilder<Duration>(
      stream: audioService.onPositionChanged ?? const Stream.empty(),
      builder: (context, positionSnapshot) {
        return StreamBuilder<Duration>(
          stream: audioService.onDurationChanged ?? const Stream.empty(),
          builder: (context, durationSnapshot) {
            final position = positionSnapshot.data ?? Duration.zero;
            final total = durationSnapshot.data ?? const Duration(seconds: 1);
            return Column(
              children: [
                Slider(
                  min: 0,
                  max: total.inMilliseconds.toDouble(),
                  value:
                      position.inMilliseconds
                          .clamp(0, total.inMilliseconds)
                          .toDouble(),
                  activeColor: AppColors.goldLightColor,
                  inactiveColor: AppColors.gery600,
                  onChanged: (value) {
                    audioService.seek(Duration(milliseconds: value.toInt()));
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_formatDuration(position)),
                    Text(_formatDuration(total)),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
