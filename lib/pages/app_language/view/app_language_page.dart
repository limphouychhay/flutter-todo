import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/app/bloc/app_bloc.dart';
import 'package:flutter_todo/common/language_enum.dart';
import 'package:flutter_todo/localization/l10n.dart';

class AppLanguagePage extends StatelessWidget {
  const AppLanguagePage({super.key});

  static Page<void> page({Key? key}) => MaterialPage<void>(
        child: AppLanguagePage(
          key: key,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return const AppLanguageView();
  }
}

class AppLanguageView extends StatelessWidget {
  const AppLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final existedLocale = context.read<AppBloc>().state.selectedLanguage;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.languageLabel),
      ),
      body: Card(
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: LanguageData.values.length,
          separatorBuilder: (_, index) => const Divider(),
          itemBuilder: (ctx, index) {
            final item = LanguageData.values[index];

            return InkWell(
              onTap: () {
                if (item != existedLocale) {
                  context.read<AppBloc>().add(LanguageChanged(locale: item));
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
                  visible: item == existedLocale,
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
