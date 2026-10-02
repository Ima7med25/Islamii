import 'package:equatable/equatable.dart';

class AudioDetialsEntity extends Equatable {
  final String? reciter;
  final String? url;
  final String? originalUrl;

  const AudioDetialsEntity({this.reciter, this.url, this.originalUrl});

  @override
  List<Object?> get props => [reciter, url, originalUrl];
}
