import 'package:flutter/material.dart';

class TextButtonCustom extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;
  final Color borderColor;
  final Color textColor;
  final double? size;
  final bool? isTextBold;

  const TextButtonCustom({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isEnabled,
    required this.borderColor,
    required this.textColor,
    this.size,
    this.isTextBold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: size != null && size! > 0 ? size : 160,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: borderColor,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 18,
            letterSpacing: 0,
            color: textColor,
            fontWeight: isTextBold != null && isTextBold == true
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
        onPressed: isEnabled == true ? onPressed : null,
      ),
    );
  }
}
