import 'package:flutter/material.dart';

import '../preferences_module/selection_button.dart';
import '../models/image_data.dart';

class ImageContainer extends StatefulWidget {
  final double height;
  final List list;
  final bool isArtistPage;

  const ImageContainer(
      {Key? key,
      required this.height,
      required this.list,
      required this.isArtistPage})
      : super(key: key);

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.isArtistPage
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: SelectionButton(
                            str: "+ Follow",
                            textColor: Colors.white,
                            buttonColor: Theme.of(context).primaryColor,
                            borderColor: Theme.of(context).primaryColor,
                            size: const Size(120, 30),
                            func: () {}),
                      )
                    : Container(height: 0),
                SelectionButton(
                    str: "Featured",
                    textColor: Colors.white,
                    buttonColor: Colors.transparent,
                    borderColor: Colors.white,
                    size: const Size(120, 30),
                    func: () {}),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                      text: "All About Summer".toTitleCase(),
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            letterSpacing: 0.05,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "\nBright Encounters  .  2 hours ago",
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ]),
                ),
              ]),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.list[7]), fit: BoxFit.cover))),
    );
  }
}
