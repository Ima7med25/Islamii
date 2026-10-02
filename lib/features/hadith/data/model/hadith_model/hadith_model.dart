import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:islami_app/features/hadith/domain/entity/hadith_entity/hadith_entity.dart';

part 'hadith_model.g.dart';

@HiveType(typeId: 8)
class HadithModel extends Equatable {
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

  const HadithModel({
    this.id,
    this.chapterNumber,
    this.chapterEnglish,
    this.chapterUrdu,
    this.chapterArabic,
    this.bookSlug,
  });

  HadithEntity toEntity() {
    return HadithEntity(
      id: id,
      chapterNumber: chapterNumber,
      chapterEnglish: chapterEnglish,
      chapterUrdu: chapterUrdu,
      chapterArabic: chapterArabic,
      bookSlug: bookSlug,
    );
  }

  factory HadithModel.fromJson(Map<String, dynamic> json) => HadithModel(
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
