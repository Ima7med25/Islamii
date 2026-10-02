import 'package:equatable/equatable.dart';
import 'package:islami_app/features/hadith/domain/entity/hadith_chapter_details_entity/chapter_hadith_entity.dart';

class HadithDetailsEntitiy extends Equatable {
  final int? id;
  final String? hadithNumber;
  final String? hadithArabic;
  final String? headingArabic;
  final String? chapterId;
  final String? status;
  final ChapterHadithEntity? chapter;

  const HadithDetailsEntitiy({
    this.id,
    this.hadithNumber,
    this.hadithArabic,
    this.headingArabic,
    this.chapterId,
    this.status,
    this.chapter,
  });

  @override
  List<Object?> get props => [
    id,
    hadithNumber,
    hadithArabic,
    headingArabic,
    chapterId,
    status,
    chapter,
  ];
}
