import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/features/pray/domain/entitiy/azkar_entity.dart/azkar_entity.dart';
import 'package:islami_app/features/pray/domain/repo/azkar_repo.dart';
part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit(this.azkarRepo) : super(AzkarInitial());
  final AzkarRepo azkarRepo;

  PageController controller = PageController();
  int initialPage = 0;

  Future<void> getAzkar({required String azkarName}) async {
    emit(AzkarLoading());
    final failureOrAzkar = await azkarRepo.getAzkar(azkarName: azkarName);
    failureOrAzkar.fold(
      (failure) => emit(AzkarFailure(message: failure)),
      (azkar) => emit(AzkarSuccess(azkarEntity: azkar, index: 0)),
    );
  }

  void changeIndex(int newIndex) {
    final current = state;
    if (current is AzkarSuccess) {
      emit(AzkarSuccess(azkarEntity: current.azkarEntity, index: newIndex));
    }
  }

  int repeate = 0;
  void repeateAzkar(int numOfRepeate) {
    repeate++;
    final current = state;
    if (current is AzkarSuccess) {
      if (repeate < numOfRepeate) {
        emit(
          AzkarSuccess(
            azkarEntity: current.azkarEntity,
            index: current.index,
            repeate: repeate,
          ),
        );
      } else {
        repeate = 0;
        nextPage(current.azkarEntity.length);
        emit(
          AzkarSuccess(
            azkarEntity: current.azkarEntity,
            index: current.index + 1,
            repeate: repeate,
          ),
        );
        log("repeate : $repeate");
      }
    }
  }

  void nextPage(int azkarLength) {
    if (controller.page! < azkarLength) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }
}
