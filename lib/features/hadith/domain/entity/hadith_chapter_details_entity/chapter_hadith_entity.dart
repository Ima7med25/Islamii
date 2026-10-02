import 'package:equatable/equatable.dart';

class ChapterHadithEntity extends Equatable {
  final int? id;
  final String? chapterArabic;
  final String? bookSlug;

  const ChapterHadithEntity({this.id, this.chapterArabic, this.bookSlug});

  @override
  List<Object?> get props => [id, chapterArabic, bookSlug];
}
