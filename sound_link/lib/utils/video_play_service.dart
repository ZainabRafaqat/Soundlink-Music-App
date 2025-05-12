import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';
import 'package:chewie/chewie.dart';

enum VideoStatus { paused, unintialized, playing, buffering }

class VideoPlayService with ChangeNotifier {
  VideoPlayerController? _controller;
  ChewieController? _chewieController;
  late VideoStatus _status;
  double _progress = 0.0;
  String? _thumbnailPath;

  VideoStatus get getVideoStatus => _status;
  double get getProgress => _progress;
  String? get getVideoThumbnail => _thumbnailPath;

  VideoPlayService.instance() {
    _controller = null;
    _chewieController = null;
    _status = VideoStatus.unintialized;
  }

  Future<void> _playVideoFromNetwork(String url) async {
    _controller = VideoPlayerController.network(url);
    _controller?.addListener(() {
      if (_controller == null) {
        _status = VideoStatus.unintialized;
      } else if (_controller?.value.isPlaying == true) {
        _status = VideoStatus.playing;
      } else if (_controller?.value.isBuffering == true) {
        _status = VideoStatus.buffering;
      } else if (_controller?.value.isBuffering == false &&
          _controller?.value.isInitialized == true &&
          _controller?.value.isPlaying == false) {
        _status = VideoStatus.paused;
      }

      if (_status != VideoStatus.buffering ||
          _status != VideoStatus.unintialized) {
        _progress = _controller != null
            ? _controller!.value.position.inMicroseconds /
                _controller!.value.duration.inMicroseconds
            : 0.0;
      }

      notifyListeners();
    });

    await _controller?.initialize();

    _thumbnailPath = await VideoThumbnail.thumbnailFile(
      video: url,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.JPEG,
    );

    _chewieController = ChewieController(
      videoPlayerController: _controller!,
      allowFullScreen: true,
      allowMuting: true,
      allowPlaybackSpeedChanging: true,
      autoPlay: true,
      looping: true,
      autoInitialize: true,
      materialProgressColors: ChewieProgressColors(),
      aspectRatio: _controller!.value.aspectRatio,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        );
      },
    );
  }

  void disposePlayer() {
    if (_chewieController != null && _controller != null) {
      _chewieController!.dispose();
      _controller!.dispose();
      _chewieController = null;
      _controller = null;
      _status = VideoStatus.unintialized;
    }
  }

  Widget getPlayer(String url) {
    return FutureBuilder(
      future: _playVideoFromNetwork(url),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Chewie(controller: _chewieController!);
        } else {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.blue.shade800,
              ),
            ),
          );
        }
      },
    );
  }
}
