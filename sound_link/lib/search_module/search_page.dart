import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../preferences_module/preference_page.dart';
import '../theme/theme_control.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: const Text('Settings Page'),
        actions: [
          Switch(
            value: Provider.of<DarkThemeProvider>(context, listen: false)
                .darkTheme,
            onChanged: (val) {
              setState(() {
                Provider.of<DarkThemeProvider>(context, listen: false)
                    .darkTheme = val;
              });
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is Search Screen'),
            TextButton.icon(
              icon: const Icon(Icons.tune),
              label: const Text('Icons navigate to the preferences page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const PreferencePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
