import 'package:flutter/material.dart';
import 'package:flutter_todo/localization/l10n.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page({Key? key}) => NoTransitionPage<void>(
        child: HomePage(
          key: key,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.homeLabel),
      ),
      floatingActionButton: ElevatedButton(
        child: const Text('Add Task'),
        onPressed: () {},
      ),
    );
  }
}
