import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '/utils/video_play_service.dart';

import './home_screen.dart';

class WrapperHomeScreen extends StatelessWidget {
  const WrapperHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VideoPlayService>(
      create: (_) => VideoPlayService.instance(),
      child: Consumer<VideoPlayService>(
        builder: (ctx, videoPlayService, child) {
          return const HomeScreen();
        },
        child: const HomeScreen(),
      ),
    );
  }
}
