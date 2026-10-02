import 'package:equatable/equatable.dart';

class HadithEntity extends Equatable {
  final int? id;
  final String? chapterNumber;
  final String? chapterEnglish;
  final String? chapterUrdu;
  final String? chapterArabic;
  final String? bookSlug;

  const HadithEntity({
    this.id,
    this.chapterNumber,
    this.chapterEnglish,
    this.chapterUrdu,
    this.chapterArabic,
    this.bookSlug,
  });

  @override
  List<Object?> get props => [
    id,
    chapterNumber,
    chapterEnglish,
    chapterUrdu,
    chapterArabic,
    bookSlug,
  ];
}
