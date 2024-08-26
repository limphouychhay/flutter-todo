import 'package:flutter/material.dart';
import 'package:flutter_todo/localization/l10n.dart';
import 'package:go_router/go_router.dart';

class ScaffoldNavBar extends StatefulWidget {
  const ScaffoldNavBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldNavBar> createState() => _ScaffoldNavBarState();
}

class _ScaffoldNavBarState extends State<ScaffoldNavBar> {
  List<ScaffoldNavBarTabItem> get _tabItems {
    final l10n = context.l10n;

    return [
      ScaffoldNavBarTabItem(
        initialLocation: '/home',
        icon: const Icon(Icons.home),
        label: l10n.homeLabel,
      ),
      ScaffoldNavBarTabItem(
        initialLocation: '/consult',
        icon: const Icon(Icons.settings),
        label: l10n.settingLabel,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomNavigationBar(
            items: _tabItems,
            currentIndex: widget.navigationShell.currentIndex,
            onTap: (index) => widget.navigationShell.goBranch(
              index,
              initialLocation: index == widget.navigationShell.currentIndex,
            ),
            // iconSize: 25,
            // selectedFontSize: 12,
            // unselectedFontSize: 10,
            // selectedLabelStyle: const TextStyle(
            //   fontWeight: FontWeight.w500,
            // ),
            // unselectedLabelStyle: const TextStyle(
            //   fontWeight: FontWeight.w500,
            // ),
          ),
        ],
      ),
    );
  }
}

/// Representation of a tab item in the [ScaffoldNavBar]
class ScaffoldNavBarTabItem extends BottomNavigationBarItem {
  const ScaffoldNavBarTabItem({
    required this.initialLocation,
    required super.icon,
    super.label,
  });

  /// The initial location/path
  final String initialLocation;
}
