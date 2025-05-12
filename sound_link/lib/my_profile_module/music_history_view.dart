import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../music_play_module/music_play_page.dart';
import '../theme/theme_control.dart';

class MusicHistoryPage extends StatefulWidget {
  const MusicHistoryPage({Key? key}) : super(key: key);

  @override
  State<MusicHistoryPage> createState() => _MusicHistoryPageState();
}

class _MusicHistoryPageState extends State<MusicHistoryPage> {
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
            const Text('This is my music history page!'),
            TextButton.icon(
              icon: const Icon(Icons.play_arrow),
              label: const Text('Play a song '),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const MusicPlayPage(
                      nextVideoTitle: '',
                      videoLink: '',
                      videoTitle: '',
                    ),
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
