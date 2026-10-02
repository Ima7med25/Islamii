import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:islami_app/features/quran/domain/entity/sura_audio_entity/audio_detials_entity.dart';

part 'audio_details_model.g.dart';

@HiveType(typeId: 7)
class AudioDetailsModel extends Equatable {
  @HiveField(0)
  final String? reciter;
  @HiveField(1)
  final String? url;
  @HiveField(2)
  final String? originalUrl;

  const AudioDetailsModel({this.reciter, this.url, this.originalUrl});

  factory AudioDetailsModel.fromJson(Map<String, dynamic> json) =>
      AudioDetailsModel(
        reciter: json['reciter'] as String?,
        url: json['url'] as String?,
        originalUrl: json['originalUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'reciter': reciter,
    'url': url,
    'originalUrl': originalUrl,
  };

  AudioDetialsEntity toEntity() {
    return AudioDetialsEntity(
      reciter: reciter,
      url: url,
      originalUrl: originalUrl,
    );
  }

  @override
  List<Object?> get props => [reciter, url, originalUrl];
}
