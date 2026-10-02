import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/qibla/domain/repo/qibal_repo.dart';
import 'qibla_state.dart';

class QiblaCubit extends Cubit<QiblaState> {
  final QiblaRepository _repo;
  StreamSubscription? _sub;

  QiblaCubit(this._repo) : super(QiblaInitial());

  Future<void> start() async {
    emit(QiblaLoading());
    try {
      final ok = await _repo.ensureLocationPermission();
      if (!ok) {
        emit(QiblaPermissionDenied('الرجاء تفعيل خدمة الموقع ومنح الإذن.'));
        return;
      }

      final stream = await _repo.qiblaStream();
      await _sub?.cancel();
      _sub = stream.listen(
        (reading) => emit(QiblaReady(reading)),
        onError: (e) => emit(QiblaError(e.toString())),
      );
    } catch (e) {
      emit(QiblaError(e.toString()));
    }
  }

  @override
  Future<void> close() async {
    await _sub?.cancel();
    await _repo.dispose();
    return super.close();
  }
}
