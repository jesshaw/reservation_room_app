import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reservationroomapp/models/app_tab.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({Key key, @required this.activeTab, @required this.onTabSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: AppTab.values.indexOf(activeTab),
      onTap: (index) => onTabSelected(AppTab.values[index]),
      items: AppTab.values.map((tab) {
        return BottomNavigationBarItem(
            icon: Icon(appTabToIcon(tab)),
            title: Text(appTabToTitle(tab))
        );
      }).toList(),
    );
  }

  appTabToTitle(AppTab tab) {
    switch (tab) {
      case AppTab.hotels:
        return "hotels";
      case AppTab.periphery:
        return "periphery";
      case AppTab.myProfile:
        return "my profile";
      default:
        return "hotels";
    }
  }

  appTabToIcon(AppTab tab) {
    switch (tab) {
      case AppTab.hotels:
        return Icons.hotel;
      case AppTab.periphery:
        return Icons.center_focus_strong;
      case AppTab.myProfile:
        return Icons.account_box;
      default:
        return Icons.hotel;
    }
  }
}
