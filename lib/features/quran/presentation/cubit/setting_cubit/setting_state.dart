part of 'setting_cubit.dart';

sealed class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [];
}

final class SettingInitial extends SettingState {}

final class ChangeFontSize extends SettingState {
  final double fontSize;
  const ChangeFontSize({required this.fontSize});
  @override
  List<Object> get props => [fontSize];
}

final class AutomaticAnimationState extends SettingState {
  final bool isAutomaticAnimation;
  const AutomaticAnimationState({required this.isAutomaticAnimation});
  @override
  List<Object> get props => [isAutomaticAnimation];
}
