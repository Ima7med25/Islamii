import 'package:hive/hive.dart';
import 'package:islami_app/core/api/api_keys.dart';
import 'package:islami_app/features/hadith/data/model/hadith_chapter_details_model/chapter_model.dart';
import 'package:islami_app/features/hadith/data/model/hadith_chapter_details_model/hadith_details_model.dart';
import 'package:islami_app/features/hadith/data/model/hadith_model/hadith_model.dart';
import 'package:islami_app/features/pray/data/model/azkar_model/azkar_model.dart';
import 'package:islami_app/features/pray/data/model/pray_model/date_pray.dart';
import 'package:islami_app/features/pray/data/model/pray_model/designation.dart';
import 'package:islami_app/features/pray/data/model/pray_model/gregorian.dart';
import 'package:islami_app/features/pray/data/model/pray_model/hijri.dart';
import 'package:islami_app/features/pray/data/model/pray_model/location.dart';
import 'package:islami_app/features/pray/data/model/pray_model/meta.dart';
import 'package:islami_app/features/pray/data/model/pray_model/method.dart';
import 'package:islami_app/features/pray/data/model/pray_model/month.dart';
import 'package:islami_app/features/pray/data/model/pray_model/offset.dart';
import 'package:islami_app/features/pray/data/model/pray_model/params.dart';
import 'package:islami_app/features/pray/data/model/pray_model/pray_model.dart';
import 'package:islami_app/features/pray/data/model/pray_model/timings.dart';
import 'package:islami_app/features/pray/data/model/pray_model/weekday.dart';
import 'package:islami_app/features/quran/data/model/sura_audio_model/audio_details_model.dart';
import 'package:islami_app/features/quran/data/model/sura_audio_model/audio_model.dart';
import 'package:islami_app/features/quran/data/model/sura_details_model/ayah.dart';
import 'package:islami_app/features/quran/data/model/sura_details_model/edition.dart';
import 'package:islami_app/features/quran/data/model/sura_details_model/sura_details_model.dart';
import 'package:islami_app/features/quran/data/model/sura_model/sura_model.dart';
import 'package:path_provider/path_provider.dart';

abstract class HiveService {
  static Future<void> initHive() async {
    await initAdapter();
    await initBox();
  }

  static Future<void> initAdapter() async {
    var directory = await getApplicationCacheDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(SuraModelAdapter());
    Hive.registerAdapter(AyahModelAdapter());
    Hive.registerAdapter(EditionModelAdapter());
    Hive.registerAdapter(SuraDetailsModelAdapter());
    Hive.registerAdapter(AudioDetailsModelAdapter());
    Hive.registerAdapter(AudioModelAdapter());
    Hive.registerAdapter(HadithModelAdapter());
    Hive.registerAdapter(HadithDetailsModelAdapter());
    Hive.registerAdapter(ChapterModelAdapter());
    Hive.registerAdapter(AzkarModelAdapter());
    Hive.registerAdapter(PrayModelAdapter());
    Hive.registerAdapter(DesignationAdapter());
    Hive.registerAdapter(GregorianAdapter());
    Hive.registerAdapter(HijriAdapter());
    Hive.registerAdapter(LocationAdapter());
    Hive.registerAdapter(MetaAdapter());
    Hive.registerAdapter(MethodAdapter());
    Hive.registerAdapter(MonthAdapter());
    Hive.registerAdapter(OffsetAdapter());
    Hive.registerAdapter(ParamsAdapter());
    Hive.registerAdapter(TimingsAdapter());
    Hive.registerAdapter(WeekdayAdapter());
    Hive.registerAdapter(DatePrayAdapter());
  }

  static Future<void> initBox() async {
    await Hive.openBox<SuraModel>(ApiKeys.suraBox);
    await Hive.openBox<SuraDetailsModel>(ApiKeys.suraDetailsBox);
    await Hive.openBox<AudioDetailsModel>(ApiKeys.audioBox);
    await Hive.openBox<HadithModel>(ApiKeys.hadithBox);
    await Hive.openBox(ApiKeys.hadithDetailsBox);
    await Hive.openBox<AzkarModel>(ApiKeys.azkarMorningBox);
    await Hive.openBox<AzkarModel>(ApiKeys.azkarEveningBox);
    await Hive.openBox<PrayModel>(ApiKeys.prayBox);
  }

  static Future<void> clearAll() async {
    await Hive.deleteFromDisk(); // احذر! يمسح كل البيانات
  }
}
