import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_app/features/quran/domain/entity/sura_audio_entity/audio_detials_entity.dart';
import 'package:islami_app/features/quran/domain/entity/sura_detail_entity/sura_details_entity.dart';
import 'package:islami_app/features/quran/domain/entity/sura_entity/sura_entity.dart';
import 'package:islami_app/features/quran/domain/repo/quran_repo.dart';
part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit(this.quranRepo) : super(QuranInitial());
  final QuranRepo quranRepo;
  List<int> pages = [];
  TextEditingController searchController = TextEditingController();

  Future<void> getAllSura() async {
    emit(GetAllSuraLoading());
    final result = await quranRepo.getAllSura(searchController.text);
    result.fold(
      (l) => emit(GetAllSuraError(errMessage: l)),
      (r) => emit(GetAllSuraSuccess(suras: r)),
    );
  }

  Future<void> getSuraByIndex(int index) async {
    emit(GetSuraByIndexLoading());
    final result = await quranRepo.getSuraByIndex(index);
    result.fold(
      (l) => emit(GetSuraByIndexError(errMessage: l)),
      (r) => emit(GetSuraByIndexSuccess(sura: r)),
    );
  }

  Future<void> getSuraAudio(int index) async {
    emit(GetSuraAudioLoading());
    final result = await quranRepo.getSuraAudio(index);
    result.fold(
      (l) => emit(GetSuraAudioError(errMessage: l)),
      (r) => emit(GetSuraAudioSuccess(suraAudio: r)),
    );
  }
}
