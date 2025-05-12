import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../album_view_module/view_album.dart';
import '../theme/theme_control.dart';

class ViewAllAlbums extends StatefulWidget {
  const ViewAllAlbums({Key? key}) : super(key: key);

  @override
  State<ViewAllAlbums> createState() => _ViewAllAlbumsState();
}

class _ViewAllAlbumsState extends State<ViewAllAlbums> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artist Profile'),
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
            TextButton.icon(
              icon: const Icon(Icons.play_arrow),
              label: const Text('View a album'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ViewAlbum(),
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
