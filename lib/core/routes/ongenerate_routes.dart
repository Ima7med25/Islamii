import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/routes/routes.dart';
import 'package:islami_app/core/service/service_locator.dart';
import 'package:islami_app/features/dashboard/presentation/screen/dashboard_screen.dart';
import 'package:islami_app/features/hadith/data/repo/hadith_repo.dart';
import 'package:islami_app/features/hadith/domain/entity/hadith_chapter_details_entity/hadith_details_entitiy.dart';
import 'package:islami_app/features/hadith/domain/entity/hadith_entity/hadith_entity.dart';
import 'package:islami_app/features/hadith/presentation/cubit/hadith_cubit.dart';
import 'package:islami_app/features/hadith/presentation/screen/hadith_details_screen.dart';
import 'package:islami_app/features/hadith/presentation/screen/hadith_list_screen.dart';
import 'package:islami_app/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:islami_app/features/onboarding/presentation/screen/onbaording_screen.dart';
import 'package:islami_app/features/pray/presentation/screen/azkar_screen.dart';
import 'package:islami_app/features/quran/domain/entity/sura_entity/sura_entity.dart';
import 'package:islami_app/features/quran/domain/repo/quran_repo.dart';
import 'package:islami_app/features/quran/presentation/cubit/quran_cubit/quran_cubit.dart';
import 'package:islami_app/features/quran/presentation/screen/sura_details_screen.dart';

abstract class OngenerateRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => OnboardingCubit(),
                child: const OnbaordingScreen(),
              ),
        );
      case Routes.sura:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) => QuranCubit(getIt.get<QuranRepo>())
                      ..getSuraByIndex(
                        (settings.arguments as Map<String, dynamic>)['index']
                            as int,
                      ),
                child: SuraDetailsScreen(
                  suraEntity:
                      (settings.arguments as Map<String, dynamic>)['suraEntity']
                          as SuraEntity,
                ),
              ),
        );
      case Routes.hadithScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => HadithCubit(getIt.get<HadithRepo>()),
                child: ListHadithScreen(
                  hadithEntity: settings.arguments as HadithEntity,
                ),
              ),
        );
      case Routes.hadithDetailsScreen:
        return MaterialPageRoute(
          builder: (context) {
            return HadithDetailsScreen(
              hadithDetailsEntitiy: settings.arguments as HadithDetailsEntitiy,
            );
          },
        );
      case Routes.azkar:
        return MaterialPageRoute(
          builder: (_) => AzkarScreen(azkarName: settings.arguments as String),
        );
      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('No route defined'))),
        );
    }
  }
}
