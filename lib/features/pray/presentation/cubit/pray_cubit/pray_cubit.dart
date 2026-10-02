import 'package:bloc/bloc.dart';
import 'package:islami_app/core/service/formate_date_service.dart';
import 'package:islami_app/core/service/get_current_location_service.dart';
import 'package:islami_app/features/pray/domain/repo/pray_repo.dart';
import 'package:islami_app/features/pray/presentation/cubit/pray_cubit/pray_state.dart';

class PrayCubit extends Cubit<PrayState> {
  PrayCubit(this.prayRepo, this.getCurrentLocationService)
    : super(PrayInitial());
  final PrayRepo prayRepo;
  final GetCurrentLocationService getCurrentLocationService;
  Future<void> getAllPray() async {
    emit(PrayLoading());
    final position = await getCurrentLocationService.getCurrentLocation();
    final result = await prayRepo.getAllPray(
      latitude: position.latitude,
      longitude: position.longitude,
    );

    result.fold((failure) => emit(PrayFailure(message: failure)), (data) {
      final next = getNextPrayer24h(
        data.timingEntity,
        baseDate: DateTime.now(),
      );
      emit(
        PraySuccess(
          prayEntity: data,
          nextPrayerName: next.key,
          nextPrayerTime: next.value,
          isSound: true,
        ),
      );
    });
  }
}
