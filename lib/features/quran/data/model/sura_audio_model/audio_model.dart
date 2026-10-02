import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:islami_app/features/quran/data/model/sura_audio_model/audio_details_model.dart';
import 'package:islami_app/features/quran/domain/entity/sura_audio_entity/audio_entity.dart';
part 'audio_model.g.dart';

@HiveType(typeId: 6)
class AudioModel extends Equatable {
  @HiveField(0)
  final AudioDetailsModel? audioDetailsModel1;
  @HiveField(1)
  final AudioDetailsModel? audioDetailsModel2;
  @HiveField(2)
  final AudioDetailsModel? audioDetailsModel3;
  @HiveField(3)
  final AudioDetailsModel? audioDetailsModel4;
  @HiveField(4)
  final AudioDetailsModel? audioDetailsModel5;

  const AudioModel({
    required this.audioDetailsModel1,
    required this.audioDetailsModel2,
    required this.audioDetailsModel3,
    required this.audioDetailsModel4,
    required this.audioDetailsModel5,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) => AudioModel(
    audioDetailsModel1:
        json['1'] == null
            ? null
            : AudioDetailsModel.fromJson(json['1'] as Map<String, dynamic>),
    audioDetailsModel2:
        json['2'] == null
            ? null
            : AudioDetailsModel.fromJson(json['2'] as Map<String, dynamic>),
    audioDetailsModel3:
        json['3'] == null
            ? null
            : AudioDetailsModel.fromJson(json['3'] as Map<String, dynamic>),
    audioDetailsModel4:
        json['4'] == null
            ? null
            : AudioDetailsModel.fromJson(json['4'] as Map<String, dynamic>),
    audioDetailsModel5:
        json['5'] == null
            ? null
            : AudioDetailsModel.fromJson(json['5'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    '1': audioDetailsModel1?.toJson(),
    '2': audioDetailsModel2?.toJson(),
    '3': audioDetailsModel3?.toJson(),
    '4': audioDetailsModel4?.toJson(),
    '5': audioDetailsModel5?.toJson(),
  };

  AudioEntity toEntity() {
    return AudioEntity(
      audioDetialsEntity1: audioDetailsModel1?.toEntity(),
      audioDetialsEntity2: audioDetailsModel2?.toEntity(),
      audioDetialsEntity3: audioDetailsModel3?.toEntity(),
      audioDetialsEntity4: audioDetailsModel4?.toEntity(),
      audioDetialsEntity5: audioDetailsModel5?.toEntity(),
    );
  }

  @override
  List<Object?> get props => [
    audioDetailsModel1,
    audioDetailsModel2,
    audioDetailsModel3,
    audioDetailsModel4,
    audioDetailsModel5,
  ];
}
