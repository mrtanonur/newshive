import 'package:flutter/material.dart';
import 'package:newshive/main.dart';
import 'package:newshive/providers/theme_provider.dart';
import 'package:newshive/utils/constants/constants.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.only(left: 25, top: 10, right: 25),
        padding: const EdgeInsets.all(PaddingConstants.p16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Dark Mode",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            Switch.adaptive(
              value: context.watch<ThemeProvider>().isDark,
              onChanged: (_) {
                context.read<ThemeProvider>().changeTheme();
              },
            )
          ],
        ),
      ),
    );
  }
}
