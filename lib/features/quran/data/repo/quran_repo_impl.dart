import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hive/hive.dart';
import 'package:islami_app/core/api/api_consumer.dart';
import 'package:islami_app/core/api/api_endpiont.dart';
import 'package:islami_app/core/api/errors/exception.dart';
import 'package:islami_app/core/utils/functions/remove_basmala.dart';
import 'package:islami_app/features/quran/data/model/sura_audio_model/audio_details_model.dart';
import 'package:islami_app/features/quran/data/model/sura_audio_model/audio_model.dart';
import 'package:islami_app/features/quran/data/model/sura_details_model/sura_details_model.dart';
import 'package:islami_app/features/quran/data/model/sura_model/sura_model.dart';
import 'package:islami_app/features/quran/domain/entity/sura_audio_entity/audio_detials_entity.dart';
import 'package:islami_app/features/quran/domain/entity/sura_detail_entity/sura_details_entity.dart';
import 'package:islami_app/features/quran/domain/entity/sura_entity/sura_entity.dart';
import 'package:islami_app/features/quran/domain/repo/quran_repo.dart';

class QuranRepoImpl implements QuranRepo {
  final ApiConsumer api;
  final Box<SuraModel> suraBox;
  final Box<SuraDetailsModel> suraDetailsBox;
  final Box<AudioDetailsModel> audioBox;

  QuranRepoImpl({
    required this.audioBox,
    required this.suraDetailsBox,
    required this.suraBox,
    required this.api,
  });

  @override
  Future<Either<String, List<SuraEntity>>> getAllSura(String? name) async {
    try {
      if (suraBox.isNotEmpty) {
        List<SuraEntity> cachedList =
            suraBox.values.map((e) => e.toEntity()).toList();
        List<SuraEntity> filterList =
            cachedList
                .where(
                  (e) => removeDiacritics(
                    e.name.trim(),
                  ).contains(removeDiacritics(name ?? '')),
                )
                .toList();
        return Right(filterList);
      }
      final response = await api.get(path: ApiEndpiont.getAllSurah);
      final List<SuraModel> suraModel =
          (response['data'] as List).map((e) => SuraModel.fromJson(e)).toList();
      await suraBox.clear();
      for (var element in suraModel) {
        await suraBox.add(element);
      }
      List<SuraEntity> suraListEntity =
          suraModel.map((e) => e.toEntity()).toList();
      List<SuraEntity> filterList =
          suraListEntity
              .where(
                (e) => removeDiacritics(
                  e.name.trim(),
                ).contains(removeDiacritics(name ?? '')),
              )
              .toList();
      return Right(filterList);
    } on ServerException catch (e) {
      return Left(e.errorModel.error);
    } catch (e, st) {
      log('getQuran ERROR: $e');
      log('STACK: $st');
      if (suraBox.isNotEmpty) {
        log('suraBox.isNotEmpty');
        return Right(suraBox.values.map((e) => e.toEntity()).toList());
      }
      return Left('error'.tr());
    }
  }

  @override
  Future<Either<String, SuraDetailsEntity>> getSuraByIndex(int index) async {
    try {
      final sura = suraDetailsBox.get(index);
      if (suraDetailsBox.isNotEmpty && sura != null) {
        return Right(sura.toEntity());
      }
      final response = await api.get(path: '${ApiEndpiont.getSurah}/$index');
      SuraDetailsModel suraDetailsModel = SuraDetailsModel.fromJson(
        response['data'],
      );
      await suraDetailsBox.put(index, suraDetailsModel);
      log(suraDetailsBox.values.toString());
      return Right(suraDetailsModel.toEntity());
    } on ServerException catch (e) {
      return Left(e.errorModel.error);
    } catch (e, st) {
      if (suraDetailsBox.isNotEmpty) {
        final suraDetails = suraDetailsBox.get(index);
        return Right(suraDetails?.toEntity());
      }
      log('getQuran ERROR: $e');
      log('STACK: $st');
      return Left('error'.tr());
    }
  }

  @override
  Future<Either<String, List<AudioDetialsEntity>>> getSuraAudio(
    int index,
  ) async {
    try {
      final response = await api.get(
        path: '${ApiEndpiont.getSurahAudio}/$index.json',
      );
      AudioModel audioModel = AudioModel.fromJson(response['audio']);
      List<AudioDetailsModel> audioDetialsModelList = [
        audioModel.audioDetailsModel1!,
        audioModel.audioDetailsModel2!,
        audioModel.audioDetailsModel3!,
        audioModel.audioDetailsModel4!,
        audioModel.audioDetailsModel5!,
      ];

      for (var element in audioDetialsModelList) {
        await audioBox.add(element);
      }
      log(audioBox.values.toString());
      List<AudioDetialsEntity> audioDetialsEntityList =
          audioDetialsModelList.map((e) => e.toEntity()).toList();
      return Right(audioDetialsEntityList);
    } on ServerException catch (e) {
      log('getSuraAudio ERROR: $e');
      return Left(e.errorModel.error);
    } catch (e) {
      log('getSuraAudio ERROR: $e');
      return Left('error'.tr());
    }
  }
}
