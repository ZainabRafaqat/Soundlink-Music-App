import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String pathOfIcon;
  final Color buttonColor;
  final Color textColor;
  const IconTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.pathOfIcon,
    required this.buttonColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: MediaQuery.of(context).size.width * 0.7,
      height: 45,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage(pathOfIcon),
                height: 35.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  text,
                  style: TextStyle(
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Lato',
                    fontSize: 18,
                    color: textColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
