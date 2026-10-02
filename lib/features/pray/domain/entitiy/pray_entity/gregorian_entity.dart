import 'package:equatable/equatable.dart';

class GregorianEntity extends Equatable {
  final String? date;

  const GregorianEntity({this.date});

  @override
  List<Object?> get props => [date];
}
