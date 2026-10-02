import 'package:dartz/dartz.dart';
import 'package:islami_app/features/pray/domain/entitiy/azkar_entity.dart/azkar_entity.dart';

abstract class AzkarRepo {
  Future<Either<String, List<AzkarEntity>>> getAzkar({
    required String azkarName,
  });
}
