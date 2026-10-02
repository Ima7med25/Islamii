part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  final bool isDarkMode;

  const ThemeState({required this.isDarkMode});
  @override
  List<Object> get props => [isDarkMode];
}

final class ChangeAppTheme extends ThemeState {
  const ChangeAppTheme({required super.isDarkMode});
}
