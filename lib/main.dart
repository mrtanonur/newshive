import 'package:flutter/material.dart';
import 'package:newshive/pages/main_page.dart';
import 'package:newshive/providers/news_provider.dart';
import 'package:newshive/providers/theme_provider.dart';
import 'package:newshive/utils/themes/dark_theme.dart';
import 'package:newshive/utils/themes/light_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => NewsProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider())
    ], child: const MyWidget()),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: context.watch<ThemeProvider>().themeMode,
      home: MainPage(),
    );
  }
}
