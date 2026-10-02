import 'package:dartz/dartz.dart';
import 'package:islami_app/features/quran/domain/entity/sura_audio_entity/audio_detials_entity.dart';
import 'package:islami_app/features/quran/domain/entity/sura_detail_entity/sura_details_entity.dart';
import 'package:islami_app/features/quran/domain/entity/sura_entity/sura_entity.dart';

abstract class QuranRepo {
  Future<Either<String, List<SuraEntity>>> getAllSura(String? name);
  Future<Either<String, SuraDetailsEntity>> getSuraByIndex(int index);
  Future<Either<String, List<AudioDetialsEntity>>> getSuraAudio(int index);
}
