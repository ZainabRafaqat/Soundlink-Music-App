import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/theme/theme_control.dart';

class VideoPlayMinimized extends StatelessWidget {
  final String? imgPath;
  final String videoTitle;
  final String subTitle;
  final bool isBuffering;
  final bool isPlaying;
  final double valueOfProgress;
  final VoidCallback onThumbnailButtonPressed;
  final VoidCallback onUpwardArrowPressed;
  const VideoPlayMinimized({
    Key? key,
    this.imgPath,
    required this.videoTitle,
    required this.subTitle,
    required this.isBuffering,
    required this.valueOfProgress,
    required this.onThumbnailButtonPressed,
    required this.onUpwardArrowPressed,
    required this.isPlaying,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).backgroundColor,
      elevation: 1,
      child: ListTile(
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Icon(
              Icons.keyboard_arrow_up,
              size: 33,
              color: Color.fromRGBO(64, 70, 66, 1.0),
            ),
          ],
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.black12,
          backgroundImage: FileImage(
            File(imgPath == null ? '' : imgPath!),
          ),
          minRadius: 28,
          maxRadius: 30,
          child: Stack(
            children: [
              if (!isBuffering)
                Center(
                  child: Transform.scale(
                    scale: 1.5,
                    child: CircularProgressIndicator(
                      value: valueOfProgress,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              if (isBuffering)
                Center(
                  child: Transform.scale(
                    scale: 1.5,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              if (!isBuffering)
                Center(
                  child: IconButton(
                    onPressed: onThumbnailButtonPressed,
                    icon: isPlaying == false && isBuffering == false
                        ? const Icon(
                            Icons.pause,
                            color: Colors.red,
                            size: 33,
                          )
                        : const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 33,
                          ),
                  ),
                ),
            ],
          ),
        ),
        title: Text(
          videoTitle,
          style: TextStyle(
            fontFamily: 'Product Sans',
            fontSize: 14,
            overflow: TextOverflow.fade,
            fontWeight: FontWeight.w500,
            color: Provider.of<DarkThemeProvider>(context).darkTheme == true
                ? Colors.white
                : const Color.fromRGBO(64, 70, 66, 1.0),
          ),
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.fade,
        ),
        subtitle: Text(
          subTitle,
          style: TextStyle(
            fontFamily: 'Product Sans',
            overflow: TextOverflow.fade,
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: Provider.of<DarkThemeProvider>(context).darkTheme == true
                ? const Color.fromRGBO(132, 132, 132, 1.0)
                : const Color.fromRGBO(163, 173, 175, 1.0),
          ),
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.fade,
        ),
      ),
    );
  }
}
