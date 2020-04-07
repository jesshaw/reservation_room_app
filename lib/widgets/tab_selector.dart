import 'package:flutter/cupertino.dart';
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
            icon: Icon(
              tab == AppTab.hotels ? Icons.hotel : Icons.account_box,
            ),
            title: Text(tab == AppTab.hotels ? 'hotels' : 'my profile'));
      }).toList(),
    );
  }
}
