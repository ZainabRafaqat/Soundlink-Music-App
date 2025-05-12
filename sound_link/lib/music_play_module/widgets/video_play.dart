import 'package:flutter/material.dart';

import '/utils/video_play_service.dart';

class VideoPlay extends StatefulWidget {
  const VideoPlay({Key? key}) : super(key: key);

  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  late VideoPlayService _service;

  @override
  void initState() {
    super.initState();
    _service = VideoPlayService.instance();
  }

  @override
  Widget build(BuildContext context) {
    return _service.getPlayer(
      'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4',
    );
  }
}
