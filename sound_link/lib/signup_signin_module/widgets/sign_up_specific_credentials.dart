import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '/theme/theme_control.dart';

import '../widgets/text_button_custom.dart';

class SignUpSpecificCredentials extends StatefulWidget {
  final VoidCallback onPressed;
  const SignUpSpecificCredentials({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  @override
  State<SignUpSpecificCredentials> createState() =>
      _SignUpSpecificCredentialsState();
}

class _SignUpSpecificCredentialsState extends State<SignUpSpecificCredentials> {
  Widget getText(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
      child: Text(
        text,
        style: TextStyle(
          letterSpacing: 0,
          color: Provider.of<DarkThemeProvider>(context, listen: false)
                      .darkTheme ==
                  false
              ? Colors.black
              : Colors.white,
          fontSize: 16,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            padding: EdgeInsets.zero,
            height: MediaQuery.of(context).size.height * 0.10,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButtonCustom(
                  textColor:
                      Provider.of<DarkThemeProvider>(context, listen: false)
                                  .darkTheme ==
                              true
                          ? Colors.white
                          : Colors.black,
                  borderColor:
                      Provider.of<DarkThemeProvider>(context, listen: false)
                                  .darkTheme ==
                              false
                          ? const Color.fromRGBO(178, 172, 172, 1.0)
                          : Colors.white,
                  onPressed: widget.onPressed,
                  text: 'DONE',
                  isEnabled: true,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.10,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('By clicking on "Sign up", you accept the'),
                Text(
                  'Terms and Conditions of Use.',
                  style: TextStyle(
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
