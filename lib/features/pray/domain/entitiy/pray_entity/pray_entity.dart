import 'package:equatable/equatable.dart';
import 'package:islami_app/features/pray/domain/entitiy/pray_entity/data_pray_info_entity.dart';
import 'package:islami_app/features/pray/domain/entitiy/pray_entity/time_pray_entity.dart';

class PrayEntity extends Equatable {
  final TimePrayEntity timingEntity;
  final DataPrayInfoEntity dataInfoEntity;

  const PrayEntity({required this.timingEntity, required this.dataInfoEntity});

  @override
  List<Object?> get props => [timingEntity, dataInfoEntity];
}
