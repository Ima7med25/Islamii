import 'package:equatable/equatable.dart';
import 'package:islami_app/features/quran/domain/entity/sura_audio_entity/audio_detials_entity.dart';

class AudioEntity extends Equatable {
  final AudioDetialsEntity? audioDetialsEntity1;
  final AudioDetialsEntity? audioDetialsEntity2;
  final AudioDetialsEntity? audioDetialsEntity3;
  final AudioDetialsEntity? audioDetialsEntity4;
  final AudioDetialsEntity? audioDetialsEntity5;

  const AudioEntity({
    required this.audioDetialsEntity1,
    required this.audioDetialsEntity2,
    required this.audioDetialsEntity3,
    required this.audioDetialsEntity4,
    required this.audioDetialsEntity5,
  });

  @override
  List<Object?> get props => [
    audioDetialsEntity1,
    audioDetialsEntity2,
    audioDetialsEntity3,
    audioDetialsEntity4,
    audioDetialsEntity5,
  ];
}
