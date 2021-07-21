import 'package:flutter/material.dart';
import 'package:vptrics/styles/app_icons.dart';
import 'package:vptrics/styles/styles.dart';

import 'bottom_app_bar_tab.dart';

final Object _tabsHeroObject = Object();

class AppBottomAppBar extends StatelessWidget {
  final AppBottomAppBarTab? activeTab;
  final void Function(AppBottomAppBarTab) onTap;
  const AppBottomAppBar({
    Key? key,
    this.activeTab,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      clipBehavior: Clip.hardEdge,
      child: BottomAppBar(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _generateTabs(context),
        ),
      ),
    );
  }

  List<Widget> _generateTabs(BuildContext context) {
    final Map<AppBottomAppBarTab, Widget> _tabs = {
      AppBottomAppBarTab.notifications: BottomAppBarTab(
        onPressed: () {
          this.onTap(AppBottomAppBarTab.notifications);
        },
        icon: Stack(
          children: [
            Icon(AppIcons.notifications),
            Positioned(
              right: 0,
              top: 0,
              child: Icon(
                Icons.circle,
                size: 8,
                color: activeColor,
              ),
            )
          ],
        ),
        active: activeTab == AppBottomAppBarTab.notifications,
      ),
      AppBottomAppBarTab.petients: BottomAppBarTab(
        icon: Icon(AppIcons.people),
        onPressed: () {
          this.onTap(AppBottomAppBarTab.petients);
        },
        active: activeTab == AppBottomAppBarTab.petients,
      ),
      AppBottomAppBarTab.settings: BottomAppBarTab(
        onPressed: () {
          this.onTap(AppBottomAppBarTab.settings);
        },
        icon: Icon(AppIcons.settings),
        active: activeTab == AppBottomAppBarTab.settings,
      ),
    };
    return _tabs.entries.map((entry) {
      if (entry.key == activeTab)
        return Hero(tag: _tabsHeroObject, child: entry.value);
      else
        return entry.value;
    }).toList();
  }
}

enum AppBottomAppBarTab {
  notifications,
  petients,
  settings,
}
