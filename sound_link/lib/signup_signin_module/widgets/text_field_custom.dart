import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import '/theme/theme_control.dart';

class TextFieldCustom extends StatefulWidget {
  final TextEditingController textEditingController;
  final String placeHolder;
  final TextInputType textInputType;
  final bool isPasswordField;
  final Function validatorFunction;

  const TextFieldCustom({
    Key? key,
    required this.textEditingController,
    required this.placeHolder,
    required this.textInputType,
    required this.isPasswordField,
    required this.validatorFunction,
  }) : super(key: key);

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  Icon? suffixIcon;
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
      keyboardType: widget.textInputType,
      maxLines: 1,
      onChanged: (changedText) {
        if (changedText.isEmpty) {
          setState(() {
            suffixIcon = null;
          });
          return;
        }
        if (widget.validatorFunction(changedText) == null) {
          setState(() {
            suffixIcon = const Icon(
              Icons.check,
              color: Colors.black,
              size: 30,
            );
          });
        } else {
          setState(() {
            suffixIcon = const Icon(
              Icons.close,
              color: Colors.black,
              size: 30,
            );
          });
        }
      },
      style: const TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: 'Lato',
        letterSpacing: 0,
        fontSize: 16,
        color: Colors.black,
      ),
      obscureText: widget.isPasswordField && hidePassword ? true : false,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          fontFamily: 'Lato',
          fontSize: 16,
          color: Colors.black,
        ),
        suffixIcon: Container(
          width: 100,
          margin: const EdgeInsets.only(right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (widget.isPasswordField)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: FittedBox(
                      alignment: Alignment.center,
                      fit: BoxFit.fitHeight,
                      child: IconTheme(
                        data: const IconThemeData(),
                        child: Icon(
                          widget.isPasswordField && hidePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              if (suffixIcon != null)
                const SizedBox(
                  width: 8,
                ),
              if (suffixIcon != null) suffixIcon!,
            ],
          ),
        ),
        filled: true,
        fillColor:
            Provider.of<DarkThemeProvider>(context, listen: false).darkTheme ==
                    false
                ? const Color.fromRGBO(184, 242, 234, 0.84)
                : Colors.white70,
        counterText: "",
        hintText: widget.placeHolder,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
