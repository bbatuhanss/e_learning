import 'package:flutter/material.dart';

abstract class Navigable {
  Widget buildPage(BuildContext context);

  BottomNavigationBarItem buildBottomNavigationBarItem(
      BuildContext context, bool isSelected);

  BottomNavigationBarItem buildBottomNavigationBarItemWithIcons(
      BuildContext context,
      Widget emptyIcon,
      Widget fullIcon,
      bool isSelected) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: isSelected ? fullIcon : emptyIcon,
          )
        ],
      ),
      label: '',
    );
  }
}
