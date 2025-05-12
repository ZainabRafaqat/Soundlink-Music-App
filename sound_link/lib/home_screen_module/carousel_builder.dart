import 'package:flutter/material.dart';

import '../profile_module/video_items.dart';

class CarouselBuilder extends StatefulWidget {
  final String str;
  final double height;
  final List<dynamic> list;
  final ScrollController? scrollController;

  const CarouselBuilder(
      {Key? key,
      required this.height,
      required this.list,
      this.scrollController,
      required this.str})
      : super(key: key);

  @override
  State<CarouselBuilder> createState() => _CarouselBuilderState();
}

class _CarouselBuilderState extends State<CarouselBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.str,
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: widget.height * 0.6,
            child: VideoItems(
              arr: widget.list,
              crossAxisCount: 1,
              scrollDirection: Axis.horizontal,
              scrollController: widget.scrollController,
            ),
          )
        ],
      ),
    );
  }
}
