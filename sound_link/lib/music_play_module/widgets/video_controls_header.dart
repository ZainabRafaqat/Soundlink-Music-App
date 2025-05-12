import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sound_link/music_play_module/widgets/pop_up_menu_custom.dart';
import 'package:sound_link/theme/theme_control.dart';

class VideoControlsHeader extends StatelessWidget {
  final String videoTitle;
  final Duration videoDuration;
  final String postersName;
  final VoidCallback onPressed;
  const VideoControlsHeader({
    Key? key,
    required this.videoTitle,
    required this.videoDuration,
    required this.postersName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mQueryPageHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Container(
      height: mQueryPageHeight * 0.185,
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    videoTitle,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color:
                          Provider.of<DarkThemeProvider>(context).darkTheme ==
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
                ),
                Text(
                  videoDuration.inMinutes.toString() +
                      'mins  .  ' +
                      postersName,
                  style: const TextStyle(
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
              ],
            ),
          ),
          PopUpMenuCustom(onPressed1: () {}, onPressed2: () {}),
        ],
      ),
    );
  }
}
