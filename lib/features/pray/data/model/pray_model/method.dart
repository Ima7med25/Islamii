import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'location.dart';
import 'params.dart';
part 'method.g.dart';

@HiveType(typeId: 23)
class Method extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final Params? params;
  @HiveField(3)
  final Location? location;

  const Method({this.id, this.name, this.params, this.location});

  factory Method.fromJson(Map<String, dynamic> json) => Method(
    id: json['id'] as int?,
    name: json['name'] as String?,
    params: json['params'] == null
        ? null
        : Params.fromJson(json['params'] as Map<String, dynamic>),
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'params': params?.toJson(),
    'location': location?.toJson(),
  };

  @override
  List<Object?> get props => [id, name, params, location];
}
