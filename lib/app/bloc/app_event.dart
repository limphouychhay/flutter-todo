part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppearanceModeChanged extends AppEvent {
  const AppearanceModeChanged({
    required this.mode,
  });

  final AppearanceData mode;

  @override
  List<Object> get props => [mode];
}

class LanguageChanged extends AppEvent {
  const LanguageChanged({
    required this.locale,
  });

  final LanguageData locale;

  @override
  List<Object> get props => [locale];
}
