import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../models/image_data.dart';
import '../splash_screen/shape.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({Key? key}) : super(key: key);

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  late double _height, _width;

  List shapeArr = [
    "null",
    "null",
    "assets/images/splash_screen/splash_screen3.jpg",
    "null",
    "null",
  ];
  late int prevShape = -1;
  late int prevImage = -1;

  setImage() {
    int randomShape = Random().nextInt(shapeArr.length - 1) + 0;
    int randomImage = Random().nextInt(imageArr.length - 1) + 0;

    if (randomShape == prevShape || randomImage == prevImage) {
      randomShape++;
      randomImage++;
    }
    prevShape = randomShape;
    prevImage = randomImage;

    setState(() {
      shapeArr[0] = "null";
      shapeArr[1] = "null";
      shapeArr[2] = "null";
      shapeArr[3] = "null";
      shapeArr[4] = "null";
      shapeArr[randomShape] = imageArr[randomImage];
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void initState() {
    super.initState();

    if (mounted == true) {
      Timer.periodic(const Duration(seconds: 6), (Timer t) {
        setImage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height * 0.5;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.yellow.shade300.withOpacity(1),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: _height,
              width: _width,
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Square(
                        color: Colors.purple.shade100,
                        height: _height * 0.0004,
                        width: _width * 0.00089,
                        borderRadius: 65.0,
                        borderSide1: "topLeft",
                        borderSide2: "bottomRight",
                        image: shapeArr[0]),
                    Circle(
                      color: Colors.white,
                      height: _height * 0.33,
                      width: _width * 0.33,
                    ),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Square(
                        color: Colors.white,
                        height: _height * 0.0004,
                        width: _width * 0.00089,
                        borderRadius: 65.0,
                        borderSide1: "topRight",
                        image: shapeArr[1]),
                    Square(
                        color: Colors.black,
                        height: _height * 0.0004,
                        width: _width * 0.00089,
                        borderRadius: 65.0,
                        borderSide1: "bottomLeft",
                        image: shapeArr[2]),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Square(
                        color: Colors.black,
                        height: _height * 0.0004,
                        width: _width * 0.00089,
                        borderRadius: 65.0,
                        borderSide1: "topLeft",
                        borderSide2: "bottomLeft",
                        image: shapeArr[3]),
                    Square(
                        color: Colors.purple.shade100,
                        height: _height * 0.0004,
                        width: _width * 0.00089,
                        borderRadius: 65.0,
                        borderSide1: "topLeft",
                        borderSide2: "bottomRight",
                        image: shapeArr[4]),
                  ]),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: "Peace . Love \nMusic",
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontSize: 32,
                      letterSpacing: 0.1,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "\nAll world tunes and new releases. Showcase your own talent.",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontSize: 20,
                          color: Colors.black,
                          letterSpacing: 0.83,
                          height: 1.4,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
