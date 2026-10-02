import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'sebha_state.dart';

class SebhaCubit extends Cubit<SebhaState> {
  SebhaCubit() : super(SebhaInitial());

  int sebhaCount = 0;
  int numOfRounds = 0;

  void startSebha() {
    sebhaCount = 0;
    numOfRounds = 0;
    emit(SebhaCountChanged(sebhaCount: sebhaCount, numOfRounds: numOfRounds));
  }

  void changeSebhaCount() {
    if (sebhaCount < 32) {
      sebhaCount++;
      emit(SebhaCountChanged(sebhaCount: sebhaCount, numOfRounds: numOfRounds));
    } else {
      sebhaCount = 0;
      numOfRounds++;
      emit(SebhaCountChanged(sebhaCount: sebhaCount, numOfRounds: numOfRounds));
    }
  }
}
