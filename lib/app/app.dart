import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/app/bloc/app_bloc.dart';
import 'package:flutter_todo/common/constant.dart';
import 'package:flutter_todo/di/di.dart';
import 'package:flutter_todo/localization/l10n.dart';
import 'package:flutter_todo/routes/route.dart';
import 'package:flutter_todo/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter().router;

    ThemeMode translateThemeMode(String themeMode) {
      switch (themeMode) {
        case AppearanceMode.light:
          return ThemeMode.light;
        case AppearanceMode.dark:
          return ThemeMode.dark;
        default:
          return ThemeMode.system;
      }
    }

    return BlocProvider<AppBloc>(
      create: (_) => AppBloc(
        preferences: getIt<SharedPreferences>(),
      ),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: translateThemeMode(state.appearanceMode.mode),
            locale: state.selectedLanguage.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routeInformationParser: appRouter.routeInformationParser,
            routeInformationProvider: appRouter.routeInformationProvider,
            routerDelegate: appRouter.routerDelegate,
          );
        },
      ),
    );
  }
}
