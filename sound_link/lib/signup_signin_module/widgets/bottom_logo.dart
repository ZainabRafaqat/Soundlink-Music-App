import 'package:flutter/material.dart';

class BottomLogo extends StatelessWidget {
  const BottomLogo({
    required this.flag,
    Key? key,
    required this.path,
  }) : super(key: key);
  final bool flag;
  final String path;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'App Version 1.0',
          style: TextStyle(
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            fontFamily: 'Lato',
            color: Color.fromRGBO(112, 112, 112, 1.0),
          ),
        ),
        flag == true
            ? Image(
                image: AssetImage(path),
              )
            : Container(),
      ],
    );
  }
}
