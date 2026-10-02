import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:islami_app/features/hadith/domain/entity/hadith_chapter_details_entity/chapter_hadith_entity.dart';
part 'chapter_model.g.dart';

@HiveType(typeId: 10)
class ChapterModel extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? chapterNumber;
  @HiveField(2)
  final String? chapterEnglish;
  @HiveField(3)
  final String? chapterUrdu;
  @HiveField(4)
  final String? chapterArabic;
  @HiveField(5)
  final String? bookSlug;

  const ChapterModel({
    this.id,
    this.chapterNumber,
    this.chapterEnglish,
    this.chapterUrdu,
    this.chapterArabic,
    this.bookSlug,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
    id: json['id'] as int?,
    chapterNumber: json['chapterNumber'] as String?,
    chapterEnglish: json['chapterEnglish'] as String?,
    chapterUrdu: json['chapterUrdu'] as String?,
    chapterArabic: json['chapterArabic'] as String?,
    bookSlug: json['bookSlug'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'chapterNumber': chapterNumber,
    'chapterEnglish': chapterEnglish,
    'chapterUrdu': chapterUrdu,
    'chapterArabic': chapterArabic,
    'bookSlug': bookSlug,
  };

  ChapterHadithEntity toEntity() {
    return ChapterHadithEntity(
      id: id,
      chapterArabic: chapterArabic,
      bookSlug: bookSlug,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      chapterNumber,
      chapterEnglish,
      chapterUrdu,
      chapterArabic,
      bookSlug,
    ];
  }
}
