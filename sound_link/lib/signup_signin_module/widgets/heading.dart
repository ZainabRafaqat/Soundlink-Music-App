import 'package:flutter/material.dart';

import '/signup_signin_module/widgets/custom_icon_back_button.dart';

class Heading extends StatelessWidget {
  const Heading({
    Key? key,
    this.pageTitle,
    required this.color,
    required this.onbackButtonPressed,
  }) : super(key: key);
  final String? pageTitle;
  final Color color;
  final VoidCallback onbackButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.all(1.0),
              height: MediaQuery.of(context).size.height * 0.05,
              child: CustomIconBackButton(
                onPressed: onbackButtonPressed,
              )),
          Container(
            padding: EdgeInsets.zero,
            height: MediaQuery.of(context).size.height * 0.09,
            child: Text(
              pageTitle!,
              style: TextStyle(
                letterSpacing: 0,
                fontFamily: 'Lato-Bold',
                fontSize: 30,
                color: color,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w800,
              ),
            ),
          )
        ],
      ),
    );
  }
}
