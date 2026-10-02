import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:islami_app/features/hadith/domain/entity/hadith_chapter_details_entity/hadith_details_entitiy.dart';
import 'chapter_model.dart';
part 'hadith_details_model.g.dart';

@HiveType(typeId: 9)
class HadithDetailsModel extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? hadithNumber;
  @HiveField(2)
  final String? englishNarrator;
  @HiveField(3)
  final String? hadithEnglish;
  @HiveField(4)
  final String? hadithUrdu;
  @HiveField(5)
  final String? urduNarrator;
  @HiveField(6)
  final String? hadithArabic;
  @HiveField(7)
  final String? headingArabic;
  @HiveField(8)
  final String? headingUrdu;
  @HiveField(9)
  final String? headingEnglish;
  @HiveField(10)
  final String? chapterId;
  @HiveField(11)
  final String? bookSlug;
  @HiveField(12)
  final String? volume;
  @HiveField(13)
  final String? status;
  @HiveField(14)
  final ChapterModel? chapter;

  const HadithDetailsModel({
    this.id,
    this.hadithNumber,
    this.englishNarrator,
    this.hadithEnglish,
    this.hadithUrdu,
    this.urduNarrator,
    this.hadithArabic,
    this.headingArabic,
    this.headingUrdu,
    this.headingEnglish,
    this.chapterId,
    this.bookSlug,
    this.volume,
    this.status,
    this.chapter,
  });

  factory HadithDetailsModel.fromJson(Map<String, dynamic> json) =>
      HadithDetailsModel(
        id: json['id'] as int?,
        hadithNumber: json['hadithNumber'] as String?,
        englishNarrator: json['englishNarrator'] as String?,
        hadithEnglish: json['hadithEnglish'] as String?,
        hadithUrdu: json['hadithUrdu'] as String?,
        urduNarrator: json['urduNarrator'] as String?,
        hadithArabic: json['hadithArabic'] as String?,
        headingArabic: json['headingArabic'] as String?,
        headingUrdu: json['headingUrdu'] as String?,
        headingEnglish: json['headingEnglish'] as String?,
        chapterId: json['chapterId'] as String?,
        bookSlug: json['bookSlug'] as String?,
        volume: json['volume'] as String?,
        status: json['status'] as String?,

        chapter:
            json['chapter'] == null
                ? null
                : ChapterModel.fromJson(
                  json['chapter'] as Map<String, dynamic>,
                ),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'hadithNumber': hadithNumber,
    'englishNarrator': englishNarrator,
    'hadithEnglish': hadithEnglish,
    'hadithUrdu': hadithUrdu,
    'urduNarrator': urduNarrator,
    'hadithArabic': hadithArabic,
    'headingArabic': headingArabic,
    'headingUrdu': headingUrdu,
    'headingEnglish': headingEnglish,
    'chapterId': chapterId,
    'bookSlug': bookSlug,
    'volume': volume,
    'status': status,
    'chapter': chapter?.toJson(),
  };

  HadithDetailsEntitiy toEntity() {
    return HadithDetailsEntitiy(
      id: id,
      hadithNumber: hadithNumber,
      hadithArabic: hadithArabic,
      headingArabic: headingArabic,
      chapter: chapter?.toEntity(),
      status: status,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      hadithNumber,
      englishNarrator,
      hadithEnglish,
      hadithUrdu,
      urduNarrator,
      hadithArabic,
      headingArabic,
      headingUrdu,
      headingEnglish,
      chapterId,
      bookSlug,
      volume,
      status,
      chapter,
    ];
  }
}
