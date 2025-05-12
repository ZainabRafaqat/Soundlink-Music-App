import 'package:flutter/material.dart';

class Square extends StatefulWidget {
  final Color color;
  final double height;
  final double width;
  final double borderRadius;
  final String borderSide1;
  final String? borderSide2;
  final String image;

  const Square({
    Key? key,
    required this.color,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.borderSide1,
    this.borderSide2 = "null",
    required this.image,
  }) : super(key: key);

  @override
  State<Square> createState() => _SquareState();
}

class _SquareState extends State<Square> {
  @override
  Widget build(BuildContext context) {
    Radius setBorderSide(String customSide, String side) {
      late Radius radius;

      if (customSide == side) {
        radius = Radius.circular(widget.borderRadius);
      } else {
        radius = const Radius.circular(0);
      }

      return radius;
    }

    return Container(
        height: MediaQuery.of(context).size.height * widget.height,
        width: MediaQuery.of(context).size.width * widget.width,
        decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.only(
              topLeft: widget.borderSide1 == "topLeft"
                  ? setBorderSide(widget.borderSide1, "topLeft")
                  : setBorderSide(widget.borderSide2!, "topLeft"),
              topRight: widget.borderSide1 == "topRight"
                  ? setBorderSide(widget.borderSide1, "topRight")
                  : setBorderSide(widget.borderSide2!, "topRight"),
              bottomLeft: widget.borderSide1 == "bottomLeft"
                  ? setBorderSide(widget.borderSide1, "bottomLeft")
                  : setBorderSide(widget.borderSide2!, "bottomLeft"),
              bottomRight: widget.borderSide1 == "bottomRight"
                  ? setBorderSide(widget.borderSide1, "bottomRight")
                  : setBorderSide(widget.borderSide2!, "bottomRight"),
            ),
            image: widget.image != "null"
                ? DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.fill,
                  )
                : null));
  }
}

class Circle extends StatefulWidget {
  final Color color;
  final double height;
  final double width;

  const Circle(
      {Key? key,
      required this.color,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  State<Circle> createState() => _CircleState();
}

class _CircleState extends State<Circle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      height: widget.height, //double.infinity,
      width: widget.width,
      child: Container(
          decoration:
              BoxDecoration(color: widget.color, shape: BoxShape.circle)),
    );
  }
}
