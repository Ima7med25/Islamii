import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/routes/ongenerate_routes.dart';
import 'package:islami_app/core/routes/routes.dart';
import 'package:islami_app/core/service/service_locator.dart';
import 'package:islami_app/core/service/shared_prefs_service.dart';
import 'package:islami_app/core/theme/bloc/theme_bloc.dart';
import 'package:islami_app/core/theme/dark_theme.dart';
import 'package:islami_app/core/theme/light_theme.dart';
import 'package:islami_app/core/translations/bloc/translations_bloc.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/features/quran/domain/repo/quran_repo.dart';
import 'package:islami_app/features/quran/presentation/cubit/quran_cubit/quran_cubit.dart';

class MuslimApp extends StatelessWidget {
  const MuslimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(
          create:
              (context) =>
                  TranslationsBloc()..add(ChangeLocaleEvent(isArabic: true)),
        ),
        BlocProvider(
          create: (context) => QuranCubit(getIt<QuranRepo>())..getAllSura(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          context.setLocale(Locale('ar'));
          return ScreenUtilInit(
            designSize: const Size(430, 932),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                onGenerateRoute: OngenerateRoutes.onGenerateRoute,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: Locale('ar'),
                theme: state.isDarkMode ? darkTheme() : lightTheme(),
                debugShowCheckedModeBanner: false,
                initialRoute:
                    SharedPrefsService.getData(AppConst.kFirstTime) == true
                        ? Routes.dashboard
                        : Routes.onBoarding,
              );
            },
          );
        },
      ),
    );
  }
}
