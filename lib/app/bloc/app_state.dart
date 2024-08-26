part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({
    AppearanceData? appearanceMode,
    LanguageData? language,
  }) : this._(
          appearanceMode: appearanceMode,
          selectedLanguage: language,
        );

  const AppState._({
    AppearanceData? appearanceMode,
    LanguageData? selectedLanguage,
  })  : appearanceMode = appearanceMode ?? AppearanceData.system,
        selectedLanguage = selectedLanguage ?? LanguageData.english;

  AppState mode(AppearanceData appearanceMode) {
    return AppState._(
      appearanceMode: appearanceMode,
      selectedLanguage: selectedLanguage,
    );
  }

  AppState language(LanguageData selectedLanguage) {
    return AppState._(
      appearanceMode: appearanceMode,
      selectedLanguage: selectedLanguage,
    );
  }

  final AppearanceData appearanceMode;
  final LanguageData selectedLanguage;

  @override
  List<Object> get props => [appearanceMode, selectedLanguage];
}
