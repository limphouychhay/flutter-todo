import 'package:flutter/material.dart';
import 'package:flutter_todo/app/widgets/widget.dart';
import 'package:flutter_todo/pages/page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter get router => _router;

  late final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) => '/home',
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => ScaffoldNavBar(
          navigationShell: navigationShell,
        ),
        branches: <StatefulShellBranch>[
          _homeShellBranch,
          _settingShellBranch,
        ],
      ),
    ],
  );

  final _homeShellBranch = StatefulShellBranch(
    initialLocation: '/home',
    routes: <GoRoute>[
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => HomePage.page(
          key: state.pageKey,
        ),
      ),
    ],
  );

  final _settingShellBranch = StatefulShellBranch(
    initialLocation: '/setting',
    routes: <GoRoute>[
      GoRoute(
        path: '/setting',
        pageBuilder: (context, state) => SettingPage.page(
          key: state.pageKey,
        ),
        routes: <GoRoute>[
          GoRoute(
            path: 'appLanguage',
            pageBuilder: (context, state) => AppLanguagePage.page(
              key: state.pageKey,
            ),
          ),
          GoRoute(
            path: 'appTheme',
            pageBuilder: (context, state) => AppThemePage.page(
              key: state.pageKey,
            ),
          ),
        ],
      ),
    ],
  );
}
