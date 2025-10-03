import 'package:flutter/material.dart';
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
        title: const Text("Settings"),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(SizesConstants.s12)),
        margin: const EdgeInsets.only(
            left: PaddingConstants.p24,
            top: PaddingConstants.p10,
            right: PaddingConstants.p24),
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
