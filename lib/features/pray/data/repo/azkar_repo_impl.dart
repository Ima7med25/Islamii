import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hive/hive.dart';
import 'package:islami_app/core/api/api_consumer.dart';
import 'package:islami_app/core/api/api_endpiont.dart';
import 'package:islami_app/core/api/errors/exception.dart';
import 'package:islami_app/features/pray/data/model/azkar_model/azkar_model.dart';
import 'package:islami_app/features/pray/domain/entitiy/azkar_entity.dart/azkar_entity.dart';
import 'package:islami_app/features/pray/domain/repo/azkar_repo.dart';

class AzkarRepoImpl extends AzkarRepo {
  final ApiConsumer api;
  final Box<AzkarModel> azkarMorningBox;
  final Box<AzkarModel> azkarEveningBox;
  AzkarRepoImpl({
    required this.api,
    required this.azkarMorningBox,
    required this.azkarEveningBox,
  });

  @override
  Future<Either<String, List<AzkarEntity>>> getAzkar({
    required String azkarName,
  }) async {
    try {
      if (azkarName == 'azkar_sabah') {
        final cashed = azkarMorningBox.values;
        if (cashed.isNotEmpty) {
          return Right(cashed.map((e) => e.toEntity()).toList());
        }
      } else if (azkarName == 'azkar_massa') {
        final cashed = azkarEveningBox.values;
        if (cashed.isNotEmpty) {
          return Right(cashed.map((e) => e.toEntity()).toList());
        }
      }

      final response = await api.get(
        path: "${ApiEndpiont.azkar}$azkarName.json",
      );
      final List<AzkarModel> azkarModel =
          (response['content'] as List)
              .map((e) => AzkarModel.fromJson(e))
              .toList();

      if (azkarName == 'azkar_sabah') {
        for (var element in azkarModel) {
          await azkarMorningBox.add(element);
          log(azkarMorningBox.values.toString());
        }
      } else {
        for (var element in azkarModel) {
          await azkarEveningBox.add(element);
          log(azkarEveningBox.values.toString());
        }
      }

      final List<AzkarEntity> azkarEntity =
          azkarModel.map((e) => e.toEntity()).toList();
      return Right(azkarEntity);
    } on ServerException catch (e) {
      return Left(e.errorModel.error);
    } catch (e) {
      if (azkarName == 'azkar_sabah') {
        final cashed = azkarMorningBox.values;
        if (cashed.isNotEmpty) {
          return Right(cashed.map((e) => e.toEntity()).toList());
        }
      } else if (azkarName == 'azkar_massa') {
        final cashed = azkarEveningBox.values;
        if (cashed.isNotEmpty) {
          return Right(cashed.map((e) => e.toEntity()).toList());
        }
      }
      return Left('error'.tr());
    }
  }
}
