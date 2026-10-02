part of 'azkar_cubit.dart';

sealed class AzkarState extends Equatable {
  const AzkarState();

  @override
  List<Object> get props => [];
}

final class AzkarInitial extends AzkarState {}

class AzkarLoading extends AzkarState {}

class AzkarSuccess extends AzkarState {
  final List<AzkarEntity> azkarEntity;
  final int index;
  final int repeate;
  const AzkarSuccess({
    required this.azkarEntity,
    this.index = 0,
    this.repeate = 0,
  });
  @override
  List<Object> get props => [azkarEntity, index, repeate];
}

class AzkarFailure extends AzkarState {
  final String message;
  const AzkarFailure({required this.message});
}
