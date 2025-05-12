import 'package:flutter/material.dart';

class VideoControls extends StatelessWidget {
  final double sliderValue;
  final Duration currentDuration;
  final VoidCallback onMiddleButtonPressed;
  final VoidCallback onNextButtonPressed;
  final VoidCallback onPrevButtonPressed;
  final Function onSliderSlided;
  const VideoControls({
    Key? key,
    required this.sliderValue,
    required this.currentDuration,
    required this.onMiddleButtonPressed,
    required this.onNextButtonPressed,
    required this.onPrevButtonPressed,
    required this.onSliderSlided,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mQueryPageHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.zero,
      height: mQueryPageHeight * 0.20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SliderTheme(
                data: const SliderThemeData(
                  trackHeight: 5,
                ),
                child: Slider(
                  value: sliderValue,
                  onChanged: (newValue) => onSliderSlided(newValue),
                  thumbColor: Theme.of(context).primaryColor,
                ),
              ),
              Text(
                "${currentDuration.inHours}:${currentDuration.inMinutes.remainder(60)}:${(currentDuration.inSeconds.remainder(60))}",
                style: const TextStyle(
                  fontFamily: 'Product Sans',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onPrevButtonPressed,
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.first_page_outlined,
                    size: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onMiddleButtonPressed,
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(
                    Icons.play_arrow,
                    size: 40,
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onNextButtonPressed,
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.last_page_outlined,
                    size: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
