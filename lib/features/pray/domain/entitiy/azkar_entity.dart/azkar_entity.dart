import 'package:equatable/equatable.dart';

class AzkarEntity extends Equatable {
  final String? zekr;
  final int? repeat;
  final String? bless;

  const AzkarEntity({this.zekr, this.repeat, this.bless});

  @override
  List<Object?> get props => [zekr, repeat, bless];
}
