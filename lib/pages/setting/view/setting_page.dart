import 'package:flutter/material.dart';
import 'package:flutter_todo/localization/l10n.dart';
import 'package:go_router/go_router.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  static Page<void> page({Key? key}) => NoTransitionPage<void>(
        child: SettingPage(
          key: key,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return const SettingView();
  }
}

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingLabel),
      ),
      body: _buildSettingItem(context),
    );
  }

  Widget _buildSettingItem(BuildContext context) {
    final l10n = context.l10n;

    final items = <SettingItem>[
      SettingItem(
        title: l10n.languageLabel,
        icon: const Icon(Icons.language),
        route: '/setting/appLanguage',
      ),
      SettingItem(
        title: l10n.themeLabel,
        icon: const Icon(
          Icons.app_shortcut,
        ),
        route: '/setting/appTheme',
      ),
    ];

    return Column(
      children: items.map((e) {
        return ListTile(
          leading: e.icon,
          title: Text(e.title),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => context.push(e.route),
        );
      }).toList(),
    );
  }
}

class SettingItem {
  SettingItem({
    required this.title,
    required this.icon,
    required this.route,
  });

  final String title;
  final Icon icon;
  final String route;
}
