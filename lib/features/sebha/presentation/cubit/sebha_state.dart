part of 'sebha_cubit.dart';

sealed class SebhaState extends Equatable {
  const SebhaState();

  @override
  List<Object> get props => [];
}

final class SebhaInitial extends SebhaState {}

final class SebhaCountChanged extends SebhaState {
  final int sebhaCount;
  final int numOfRounds;
  const SebhaCountChanged({
    required this.sebhaCount,
    required this.numOfRounds,
  });
  @override
  List<Object> get props => [sebhaCount, numOfRounds];
}
