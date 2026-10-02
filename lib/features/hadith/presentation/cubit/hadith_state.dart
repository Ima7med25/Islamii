part of 'hadith_cubit.dart';

sealed class HadithState extends Equatable {
  const HadithState();

  @override
  List<Object> get props => [];
}

final class HadithInitial extends HadithState {}

final class GetAllHadithLoading extends HadithState {}

final class GetAllHadithSuccess extends HadithState {
  final List<HadithEntity> hadiths;
  const GetAllHadithSuccess({required this.hadiths});
}

final class GetAllHadithError extends HadithState {
  final String error;
  const GetAllHadithError({required this.error});
}

final class GetHadithByIdLoading extends HadithState {}

final class GetHadithByIdSuccess extends HadithState {
  final List<HadithDetailsEntitiy> hadithDetails;
  const GetHadithByIdSuccess({required this.hadithDetails});
}

final class GetHadithByIdError extends HadithState {
  final String error;
  const GetHadithByIdError({required this.error});
}
