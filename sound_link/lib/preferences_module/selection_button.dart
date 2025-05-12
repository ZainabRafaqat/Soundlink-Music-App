import 'package:flutter/material.dart';

class SelectionButton extends StatefulWidget {
  final String str;
  final Color textColor;
  final Color buttonColor;
  final Color borderColor;
  final Size? size;
  final VoidCallback? func;

  const SelectionButton({
    Key? key,
    required this.str,
    this.size,
    this.func,
    required this.textColor,
    required this.buttonColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.func,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: widget.buttonColor,
        onPrimary: widget.textColor,
        fixedSize: widget.size,
        alignment: Alignment.center,
        textStyle: Theme.of(context).textTheme.button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
          side: BorderSide(
            width: 2,
            color: widget.borderColor,
          ),
        ),
      ),
      child: Text(widget.str),
    );
  }
}
