import 'package:flutter/material.dart';

class VideoItems extends StatefulWidget {
  final List<dynamic> arr;
  final ScrollController? scrollController;
  final int crossAxisCount;
  final Axis scrollDirection;

  const VideoItems(
      {Key? key,
      required this.arr,
      this.scrollController,
      required this.crossAxisCount,
      required this.scrollDirection})
      : super(key: key);

  @override
  _VideoItemsState createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      controller: widget.scrollController,
      scrollDirection: widget.scrollDirection,
      itemCount: widget.arr.length,
      itemBuilder: (BuildContext context, index) {
        return Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                  text: "Thumbnail",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "\n2 hours ago",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ]),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage(widget.arr[index]), fit: BoxFit.cover)));
      },
      shrinkWrap: true,
    );
  }
}
