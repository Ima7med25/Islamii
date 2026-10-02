import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:islami_app/features/pray/domain/entitiy/azkar_entity.dart/azkar_entity.dart';
part 'azkar_model.g.dart';

@HiveType(typeId: 12)
class AzkarModel extends Equatable {
  @HiveField(0)
  final String? zekr;
  @HiveField(1)
  final int? repeat;
  @HiveField(2)
  final String? bless;

  const AzkarModel({this.zekr, this.repeat, this.bless});

  AzkarEntity toEntity() {
    return AzkarEntity(zekr: zekr, repeat: repeat, bless: bless);
  }

  factory AzkarModel.fromJson(Map<String, dynamic> json) => AzkarModel(
    zekr: json['zekr'] as String?,
    repeat: json['repeat'] as int?,
    bless: json['bless'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'zekr': zekr,
    'repeat': repeat,
    'bless': bless,
  };

  @override
  List<Object?> get props => [zekr, repeat, bless];
}
