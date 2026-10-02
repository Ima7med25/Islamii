part of 'translations_bloc.dart';

sealed class TranslationsEvent extends Equatable {
  const TranslationsEvent();

  @override
  List<Object> get props => [];
}

class ChangeLocaleEvent extends TranslationsEvent {
  final bool isArabic;
  const ChangeLocaleEvent({required this.isArabic});

  @override
  List<Object> get props => [isArabic];
}
