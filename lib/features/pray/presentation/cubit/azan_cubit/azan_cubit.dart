import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami_app/features/pray/domain/repo/azan_repo.dart';
part 'azan_state.dart';

class AzanCubit extends Cubit<AzanState> {
  AzanCubit(this.azanRepo) : super(AzanInitial());
  final AzanRepo azanRepo;

  Future<void> getAzan({
    required String prayerName,
    required DateTime datetime,
  }) async {}
}
