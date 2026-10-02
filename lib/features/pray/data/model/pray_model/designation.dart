import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'designation.g.dart';

@HiveType(typeId: 19)
class Designation extends Equatable {
  @HiveField(0)
  final String? abbreviated;
  @HiveField(1)
  final String? expanded;

  const Designation({this.abbreviated, this.expanded});

  factory Designation.fromJson(Map<String, dynamic> json) => Designation(
    abbreviated: json['abbreviated'] as String?,
    expanded: json['expanded'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'abbreviated': abbreviated,
    'expanded': expanded,
  };

  @override
  List<Object?> get props => [abbreviated, expanded];
}
