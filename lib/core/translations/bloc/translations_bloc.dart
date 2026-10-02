import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'translations_event.dart';
part 'translations_state.dart';

class TranslationsBloc
    extends HydratedBloc<TranslationsEvent, TranslationsState> {
  TranslationsBloc() : super(TranslationsInitial(isArabic: false)) {
    on<ChangeLocaleEvent>(_changeLanguage);
  }

  void _changeLanguage(
    ChangeLocaleEvent event,
    Emitter<TranslationsState> emit,
  ) {
    emit(TranslationsInitial(isArabic: event.isArabic));
  }

  @override
  TranslationsState? fromJson(Map<String, dynamic> json) {
    return TranslationsInitial(isArabic: json['isArabic']);
  }

  @override
  Map<String, dynamic>? toJson(TranslationsState state) {
    return {'isArabic': state.isArabic};
  }
}
