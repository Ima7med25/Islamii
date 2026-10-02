import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/sebha/presentation/cubit/sebha_cubit.dart';
import 'package:islami_app/features/sebha/presentation/widgets/sebha_body_screen.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SebhaCubit(),
      child: Scaffold(body: SebhaBodyScreen()),
    );
  }
}
