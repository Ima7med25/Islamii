import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:islami_app/features/pray/domain/entitiy/pray_entity/data_pray_info_entity.dart';
import 'gregorian.dart';
import 'hijri.dart';
part 'date_pray.g.dart';

@HiveType(typeId: 15)
class DatePray extends Equatable {
  @HiveField(0)
  final String? readable;
  @HiveField(1)
  final String? timestamp;
  @HiveField(2)
  final Hijri? hijri;
  @HiveField(3)
  final Gregorian? gregorian;

  const DatePray({this.readable, this.timestamp, this.hijri, this.gregorian});

  factory DatePray.fromJson(Map<String, dynamic> json) => DatePray(
    readable: json['readable'] as String?,
    timestamp: json['timestamp'] as String?,
    hijri:
        json['hijri'] == null
            ? null
            : Hijri.fromJson(json['hijri'] as Map<String, dynamic>),
    gregorian:
        json['gregorian'] == null
            ? null
            : Gregorian.fromJson(json['gregorian'] as Map<String, dynamic>),
  );

  DataPrayInfoEntity toEntity() {
    return DataPrayInfoEntity(
      gregorian: gregorian?.toEntity(),
      readable: readable,
      hijri: hijri?.toEntity(),
    );
  }

  Map<String, dynamic> toJson() => {
    'readable': readable,
    'timestamp': timestamp,
    'hijri': hijri?.toJson(),
    'gregorian': gregorian?.toJson(),
  };

  @override
  List<Object?> get props => [readable, timestamp, hijri, gregorian];
}
