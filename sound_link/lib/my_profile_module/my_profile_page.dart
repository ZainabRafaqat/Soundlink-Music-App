import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../my_profile_module/music_history_view.dart';
import '../album_view_module/view_all_albums.dart';
import '../theme/theme_control.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
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
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is my profile page!'),
            TextButton.icon(
              icon: const Icon(Icons.play_arrow),
              label: const Text('View All of my albums'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ViewAllAlbums(),
                  ),
                );
              },
            ),
            TextButton.icon(
              icon: const Icon(Icons.play_arrow),
              label: const Text('View All songs i listened'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const MusicHistoryPage(),
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
