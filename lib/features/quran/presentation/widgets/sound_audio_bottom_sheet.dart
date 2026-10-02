import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/widgets/custom_loading_app.dart';
import 'package:islami_app/features/quran/presentation/cubit/quran_cubit/quran_cubit.dart';
import 'package:islami_app/features/quran/presentation/widgets/custom_audio_play_item.dart';

class SoundAudioBottomSheet extends StatefulWidget {
  const SoundAudioBottomSheet({super.key, required this.surahIndex});
  final int surahIndex;
  @override
  State<SoundAudioBottomSheet> createState() => _SoundAudioBottomSheetState();
}

class _SoundAudioBottomSheetState extends State<SoundAudioBottomSheet> {
  @override
  void initState() {
    context.read<QuranCubit>().getSuraAudio(widget.surahIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        if (state is GetSuraAudioSuccess) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAudioPlayItem(
                audios: state.suraAudio,
                suraIndex: widget.surahIndex,
              ),
            ],
          );
        } else if (state is GetSuraAudioLoading) {
          return SizedBox(height: 100, child: CustomLoadingApp());
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
