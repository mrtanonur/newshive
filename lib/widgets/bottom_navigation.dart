import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newshive/utils/constants/constants.dart';

class BottomNavigation extends StatefulWidget {
  final int selectedIndex;
  final void Function(int)? onTap;

  const BottomNavigation(
      {super.key, required this.selectedIndex, required this.onTap});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return BottomNavigationBar(
          currentIndex: widget.selectedIndex,
          onTap: widget.onTap,
          items: const [
            BottomNavigationBarItem(
                label: "News",
                icon: Icon(
                  Icons.newspaper,
                )),
            BottomNavigationBarItem(
                label: "Search",
                icon: Icon(
                  Icons.search,
                )),
            BottomNavigationBarItem(
              label: "Settings",
              icon: Icon(
                Icons.settings,
              ),
            )
          ]);
    } else {
      return CupertinoTabBar(
          activeColor: ColorConstants.accent,
          inactiveColor: ColorConstants.grey500,
          currentIndex: widget.selectedIndex,
          onTap: widget.onTap,
          items: const [
            BottomNavigationBarItem(
                label: "News",
                icon: Icon(
                  Icons.newspaper,
                )),
            BottomNavigationBarItem(
                label: "Search",
                icon: Icon(
                  Icons.search,
                )),
            BottomNavigationBarItem(
              label: "Settings",
              icon: Icon(
                Icons.settings,
              ),
            )
          ]);
    }
  }
}
