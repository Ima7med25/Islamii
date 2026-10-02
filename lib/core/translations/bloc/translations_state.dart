part of 'translations_bloc.dart';

sealed class TranslationsState extends Equatable {
  final bool isArabic;
  const TranslationsState({required this.isArabic});

  @override
  List<Object> get props => [isArabic];
}

final class TranslationsInitial extends TranslationsState {
  const TranslationsInitial({required super.isArabic});
}
