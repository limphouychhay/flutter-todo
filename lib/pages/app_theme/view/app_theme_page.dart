import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/app/bloc/app_bloc.dart';
import 'package:flutter_todo/common/appearance_enum.dart';
import 'package:flutter_todo/localization/l10n.dart';

class AppThemePage extends StatelessWidget {
  const AppThemePage({super.key});

  static Page<void> page({Key? key}) => MaterialPage<void>(
        child: AppThemePage(
          key: key,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return const AppThemeView();
  }
}

class AppThemeView extends StatelessWidget {
  const AppThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final selectedMode = context.watch<AppBloc>().state.appearanceMode;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.themeLabel),
      ),
      body: Card(
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: AppearanceData.values.length,
          separatorBuilder: (_, index) => const Divider(),
          itemBuilder: (ctx, index) {
            final item = AppearanceData.values[index];

            return InkWell(
              onTap: () {
                if (item != selectedMode) {
                  context.read<AppBloc>().add(
                        AppearanceModeChanged(
                          mode: item,
                        ),
                      );
                }
              },
              borderRadius: BorderRadius.vertical(
                top: item.isRadiusTop ? const Radius.circular(16) : Radius.zero,
                bottom: item.isRadiusBottom
                    ? const Radius.circular(16)
                    : Radius.zero,
              ),
              child: ListTile(
                title: Text(item.name),
                trailing: Visibility(
                  visible: item == selectedMode,
                  child: const Icon(Icons.check),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
