import 'package:equatable/equatable.dart';
import 'package:islami_app/features/qibla/domain/entity/qibla_reading_entitiy.dart';

abstract class QiblaState extends Equatable {
  @override
  List<Object?> get props => [];
}

class QiblaInitial extends QiblaState {}

class QiblaLoading extends QiblaState {}

class QiblaPermissionDenied extends QiblaState {
  final String message;
  QiblaPermissionDenied(this.message);

  @override
  List<Object?> get props => [message];
}

class QiblaReady extends QiblaState {
  final QiblaReading reading;
  QiblaReady(this.reading);

  @override
  List<Object?> get props => [reading];
}

class QiblaError extends QiblaState {
  final String message;
  QiblaError(this.message);

  @override
  List<Object?> get props => [message];
}
