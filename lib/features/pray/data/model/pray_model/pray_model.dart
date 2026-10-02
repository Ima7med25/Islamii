import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:islami_app/features/pray/domain/entitiy/pray_entity/pray_entity.dart';
import 'date_pray.dart';
import 'meta.dart';
import 'timings.dart';
part 'pray_model.g.dart';

@HiveType(typeId: 13)
class PrayModel extends Equatable {
  @HiveField(0)
  final Timings? timings;
  @HiveField(1)
  final DatePray? date;
  @HiveField(2)
  final Meta? meta;

  PrayEntity toEntity() {
    return PrayEntity(
      timingEntity: timings!.toEntity(),
      dataInfoEntity: date!.toEntity(),
    );
  }

  const PrayModel({this.timings, this.date, this.meta});

  factory PrayModel.fromJson(Map<String, dynamic> json) => PrayModel(
    timings:
        json['timings'] == null
            ? null
            : Timings.fromJson(json['timings'] as Map<String, dynamic>),
    date:
        json['date'] == null
            ? null
            : DatePray.fromJson(json['date'] as Map<String, dynamic>),
    meta:
        json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'timings': timings?.toJson(),
    'date': date?.toJson(),
    'meta': meta?.toJson(),
  };

  @override
  List<Object?> get props => [timings, date, meta];
}
