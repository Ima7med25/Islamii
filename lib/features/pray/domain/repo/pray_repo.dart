import 'package:dartz/dartz.dart';
import 'package:islami_app/features/pray/domain/entitiy/pray_entity/pray_entity.dart';

abstract class PrayRepo {
  Future<Either<String, PrayEntity>> getAllPray({
    required double latitude,
    required double longitude,
  });
}
