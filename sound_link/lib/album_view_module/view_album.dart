import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../music_play_module/music_play_page.dart';
import '../theme/theme_control.dart';

class ViewAlbum extends StatefulWidget {
  const ViewAlbum({Key? key}) : super(key: key);

  @override
  State<ViewAlbum> createState() => _ViewAlbumState();
}

class _ViewAlbumState extends State<ViewAlbum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album View'),
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
            const Text('Here All songs in album are displayed!'),
            TextButton.icon(
              icon: const Icon(Icons.play_arrow),
              label: const Text('Play a song from album'),
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
