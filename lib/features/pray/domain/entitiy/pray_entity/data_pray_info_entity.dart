import 'package:equatable/equatable.dart';
import 'package:islami_app/features/pray/domain/entitiy/pray_entity/gregorian_entity.dart';
import 'package:islami_app/features/pray/domain/entitiy/pray_entity/hijri_time_entity.dart';

class DataPrayInfoEntity extends Equatable {
  final String? readable;
  final HijriTimeEntity? hijri;
  final GregorianEntity? gregorian;

  const DataPrayInfoEntity({this.readable, this.hijri, this.gregorian});

  @override
  List<Object?> get props => [readable, hijri];
}
