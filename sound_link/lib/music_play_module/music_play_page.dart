import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sound_link/theme/theme_control.dart';

import '/utils/video_play_service.dart';

import './widgets/video_controls_header.dart';

class MusicPlayPage extends StatefulWidget {
  final String videoLink;
  final String videoTitle;
  final String nextVideoTitle;

  const MusicPlayPage({
    Key? key,
    required this.videoLink,
    required this.videoTitle,
    required this.nextVideoTitle,
  }) : super(key: key);

  @override
  State<MusicPlayPage> createState() => _MusicPlayPageState();
}

class _MusicPlayPageState extends State<MusicPlayPage> {
  @override
  Widget build(BuildContext context) {
    var mQueryPageWidth = MediaQuery.of(context).size.width;
    var mQueryPageHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.zero,
            height: mQueryPageHeight,
            width: mQueryPageWidth,
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.zero,
                        height: mQueryPageHeight * 0.70,
                        child: Provider.of<VideoPlayService>(context,
                                listen: false)
                            .getPlayer(
                          widget.videoLink,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 4,
                      left: 4,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(18),
                  child: Container(
                    padding: EdgeInsets.zero,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        VideoControlsHeader(
                          videoTitle: widget.videoTitle,
                          videoDuration: const Duration(minutes: 35),
                          postersName: 'Mujab',
                          onPressed: () {},
                        ),
                        Row(
                          children: [
                            const Text(
                              'Playing Next  ',
                              style: TextStyle(
                                fontFamily: 'Product Sans',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(
                                  163,
                                  173,
                                  175,
                                  1.0,
                                ),
                              ),
                            ),
                            Text(
                              widget.nextVideoTitle,
                              style: TextStyle(
                                fontFamily: 'Product Sans',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Provider.of<DarkThemeProvider>(context)
                                            .darkTheme ==
                                        true
                                    ? Colors.white
                                    : const Color.fromRGBO(
                                        64,
                                        70,
                                        66,
                                        1.0,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  height: mQueryPageHeight * 0.30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
