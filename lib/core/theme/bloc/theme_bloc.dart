import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ChangeAppTheme(isDarkMode: true)) {
    on<ChangeTheme>(_onThemeChanged);
  }

  void _onThemeChanged(ChangeTheme event, Emitter<ThemeState> emit) {
    emit(ChangeAppTheme(isDarkMode: event.isDark));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ChangeAppTheme(isDarkMode: json['isDarkMode']);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    if (state is ChangeAppTheme) {
      return {'isDarkMode': state.isDarkMode};
    } else {
      return {'isDarkMode': state.isDarkMode};
    }
  }
}
