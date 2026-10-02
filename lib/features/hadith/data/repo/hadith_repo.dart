import 'package:dartz/dartz.dart';
import 'package:islami_app/features/hadith/domain/entity/hadith_chapter_details_entity/hadith_details_entitiy.dart';
import 'package:islami_app/features/hadith/domain/entity/hadith_entity/hadith_entity.dart';

abstract class HadithRepo {
  Future<Either<String, List<HadithEntity>>> getAllHadith(String? name);
  Future<Either<String, List<HadithDetailsEntitiy>>> getHadithById(String id);
}
