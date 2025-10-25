import 'package:flutter/material.dart';
import 'package:knighthacksproject/colors.dart';
import 'package:knighthacksproject/icon.dart';
import 'package:knighthacksproject/monitor.dart';
import 'package:knighthacksproject/saved.dart';
import 'package:knighthacksproject/searchPage.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<PersistentTabConfig> _tabs() => [
    PersistentTabConfig(
      screen: const MonitorPage(),
      item: ItemConfig(
        icon: MonitorIcon(),
        title: "Monitor",
        activeForegroundColor: primary,
        inactiveForegroundColor: primary,
      ),
    ),
    PersistentTabConfig(
      screen: const SearchPage(),
      item: ItemConfig(
        icon: SearchIcon(),
        title: "Search",
        activeForegroundColor: primary,
        inactiveForegroundColor: primary,
      ),
    ),
    PersistentTabConfig(
      screen: const SavedPage(),
      item: ItemConfig(
        icon: SavedIcon(),
        title: "Saved",
        activeForegroundColor: primary,
        inactiveForegroundColor: primary,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      backgroundColor: bg,
      controller: _controller,
      tabs: _tabs(),
      navBarBuilder: (navBarConfig) {
        final navBarWidget = Style9BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(color: bgDarker),
        );

        final clippedNavBar = ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: navBarWidget,
        );

        return Container(
          margin: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
          child: clippedNavBar,
        );
      },
    );
  }
}
