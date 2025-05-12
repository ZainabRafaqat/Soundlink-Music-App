import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../models/image_data.dart';
import '../splash_screen/shape.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  late double _height, _width;

  List shapeArr = [
    "null",
    "null",
    "assets/images/splash_screen/splash_screen1.jpg",
    "null",
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
      shapeArr[5] = "null";
      shapeArr[randomShape] = imageArr[randomImage];
    });
  }

  // override setState to use it only if the State object is mounted on the widget tree.
  // dispose setState to avoid memory leaks

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
      backgroundColor: Colors.lime.shade50.withOpacity(0.5),
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
                    const SizedBox(width: 15),
                    Circle(
                      color: Colors.black,
                      height: _height * 0.33,
                      width: _width * 0.33,
                    ),
                    Square(
                        //2
                        color: Colors.yellow.shade300.withOpacity(1),
                        height: _height * 0.0004,
                        width: _width * 0.00089,
                        borderRadius: 65.0,
                        borderSide1: "topLeft",
                        borderSide2: "bottomRight",
                        image: shapeArr[1]),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Square(
                          //3
                          color: Colors.purple.shade100,
                          height: _height * 0.0004,
                          width: _width * 0.00089,
                          borderRadius: 65.0,
                          borderSide1: "bottomRight",
                          image: shapeArr[2]),
                      Square(
                          //4
                          color: Colors.white,
                          height: _height * 0.0004,
                          width: _width * 0.00089,
                          borderRadius: 65.0,
                          borderSide1: "bottomLeft",
                          image: shapeArr[3]),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Square(
                          //5
                          color: Colors.yellow.shade300.withOpacity(1),
                          height: _height * 0.0004,
                          width: _width * 0.00089,
                          borderRadius: 65.0,
                          borderSide1: "topRight",
                          borderSide2: "bottomLeft",
                          image: shapeArr[4]),
                      Square(
                          //6
                          color: Colors.black,
                          height: _height * 0.0004,
                          width: _width * 0.00089,
                          borderRadius: 65.0,
                          borderSide1: "topLeft",
                          borderSide2: "topRight",
                          image: shapeArr[5]),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: "Where Words Fail, \nMusic Speaks",
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontSize: 32,
                      letterSpacing: 0.1,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "\nOrganize your music in a way that's best for you.",
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
            ),
          ],
        ),
      ),
    );
  }
}
