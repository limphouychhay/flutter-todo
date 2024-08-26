import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_todo/common/appearance_enum.dart';
import 'package:flutter_todo/common/language_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_event.dart';
part 'app_state.dart';

const appearanceKey = 'appearance:mode';
const languageKey = 'language:lang';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required this.preferences,
  }) : super(
          AppState(
            appearanceMode: AppearanceData.from(
              mode: preferences.getString(appearanceKey),
            ),
            language: LanguageData.from(
              appLanguage: preferences.getString(languageKey),
            ),
          ),
        ) {
    on<AppearanceModeChanged>(_onAppearanceChange);
    on<LanguageChanged>(_onLanguageChange);
  }

  final SharedPreferences preferences;

  void _onAppearanceChange(
    AppearanceModeChanged event,
    Emitter<AppState> emit,
  ) {
    preferences.setString(appearanceKey, event.mode.mode);
    emit(state.mode(event.mode));
  }

  void _onLanguageChange(
    LanguageChanged event,
    Emitter<AppState> emit,
  ) {
    final language = event.locale;

    preferences.setString(languageKey, language.appLanguage);
    emit(state.language(language));
  }
}
