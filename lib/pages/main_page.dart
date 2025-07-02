import 'package:flutter/material.dart';
import 'package:newshive/pages/news_page.dart';
import 'package:newshive/pages/search_page.dart';
import 'package:newshive/pages/settings_page.dart';
import 'package:newshive/widgets/bottom_navigation.dart';

const List pages = [NewsPage(), SearchPage(), SettingsPage()];

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
