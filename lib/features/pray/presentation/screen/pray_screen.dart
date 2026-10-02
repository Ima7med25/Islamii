import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/service/get_current_location_service.dart';
import 'package:islami_app/core/service/service_locator.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/features/pray/domain/repo/pray_repo.dart';
import 'package:islami_app/features/pray/presentation/cubit/pray_cubit/pray_cubit.dart';
import 'package:islami_app/features/pray/presentation/widgets/pray_body.dart';

class PrayScreen extends StatelessWidget {
  const PrayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(AppImages.homeBg, fit: BoxFit.cover),
            Image.asset(AppImages.shadowBg, fit: BoxFit.cover),
            BlocProvider(
              create:
                  (context) => PrayCubit(
                    getIt<PrayRepo>(),
                    getIt<GetCurrentLocationService>(),
                  )..getAllPray(),
              child: PrayBody(),
            ),
          ],
        ),
      ),
    );
  }
}
