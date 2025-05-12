import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';

import 'widgets/bottom_logo.dart';

import '/utils/authentication_backend.dart';
import '/utils/page_switcher.dart';
import '/utils/validations.dart';

import './widgets/credentials_input.dart';
import '../theme/theme_control.dart';

import './widgets/text_button_custom.dart';
import './widgets/icon_text_button.dart';
import './widgets/heading.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailHandler = TextEditingController();
  final TextEditingController _passwordHandler = TextEditingController();
  bool _isSigningInGoogle = false;
  bool _isSigningInFacebook = false;
  final _formKey = GlobalKey<FormState>();

  void onLoginPressed() {
    if (Validators.emailValidator(_emailHandler.text.trim()) == null &&
        Validators.passwordValidator(_passwordHandler.text) == null) {
      Provider.of<AuthUtil>(context, listen: false)
          .signInEmailPass(_emailHandler.text.trim(), _passwordHandler.text);
      if (mounted) {
        setState(() {});
      }
    } else {
      Fluttertoast.showToast(msg: "Please enter valid data!");
    }
  }

  Widget get getSigningInIndicator {
    return Container(
      padding: EdgeInsets.zero,
      width: MediaQuery.of(context).size.width * 0.6,
      height: 45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _isSigningInGoogle == true
              ? LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Provider.of<DarkThemeProvider>(context, listen: false)
                                .darkTheme ==
                            true
                        ? Colors.white
                        : const Color.fromRGBO(184, 242, 234, 0.84),
                  ),
                )
              : LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.blue.shade800,
                  ),
                ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mQuery =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.zero,
            height: mQuery,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  height: mQuery * 0.15,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Provider.of<DarkThemeProvider>(context, listen: false)
                            .darkTheme = !Provider.of<DarkThemeProvider>(
                                context,
                                listen: false)
                            .darkTheme;
                      });
                    },
                    child: Heading(
                      pageTitle: 'Log In',
                      color:
                          Provider.of<DarkThemeProvider>(context, listen: false)
                                      .darkTheme ==
                                  true
                              ? Colors.white
                              : Colors.black,
                      onbackButtonPressed: () {
                        setState(() {
                          Provider.of<PageSwitcher>(context, listen: false)
                              .gotoMainPage();
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.zero,
                  height: mQuery * 0.32,
                  child: Form(
                    key: _formKey,
                    child: CredentialsInput(
                      field1Handler: _emailHandler,
                      field2Handler: _passwordHandler,
                      title1: 'Email',
                      title2: 'Password',
                      signUpPageCredentials: false,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.zero,
                  height: mQuery * 0.10,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButtonCustom(
                        textColor: Provider.of<DarkThemeProvider>(
                                  context,
                                  listen: false,
                                ).darkTheme ==
                                true
                            ? Colors.white
                            : Colors.black,
                        borderColor: Provider.of<DarkThemeProvider>(
                                  context,
                                  listen: false,
                                ).darkTheme ==
                                false
                            ? const Color.fromRGBO(178, 172, 172, 1.0)
                            : Colors.white,
                        onPressed: onLoginPressed,
                        text: 'LOG IN',
                        isEnabled: true,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.zero,
                  height: mQuery * 0.30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _isSigningInFacebook
                          ? getSigningInIndicator
                          : Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 5),
                              child: IconTextButton(
                                pathOfIcon: "assets/images/facebook_logo.png",
                                buttonColor: Colors.blue.shade800,
                                textColor: Colors.white,
                                onPressed: () async {
                                  setState(() {
                                    _isSigningInFacebook = true;
                                  });
                                  await Provider.of<AuthUtil>(context,
                                          listen: false)
                                      .signInWithFacebook();
                                  if (mounted) {
                                    setState(() {
                                      _isSigningInFacebook = false;
                                    });
                                  }
                                },
                                text: 'Log in with Facebook',
                              ),
                            ),
                      _isSigningInGoogle
                          ? getSigningInIndicator
                          : Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 5),
                              child: IconTextButton(
                                pathOfIcon: "assets/images/google_logo.png",
                                buttonColor: Provider.of<DarkThemeProvider>(
                                                context,
                                                listen: false)
                                            .darkTheme ==
                                        true
                                    ? Colors.white
                                    : const Color.fromRGBO(184, 242, 234, 0.84),
                                textColor: Colors.black,
                                onPressed: () async {
                                  setState(() {
                                    _isSigningInGoogle = true;
                                  });
                                  await Provider.of<AuthUtil>(context,
                                          listen: false)
                                      .signInWithGoogle();
                                  if (mounted) {
                                    setState(() {
                                      _isSigningInGoogle = false;
                                    });
                                  }
                                },
                                text: 'Log in with Google',
                              ),
                            ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: mQuery * 0.13,
                  child: BottomLogo(
                    flag: true,
                    path: Provider.of<DarkThemeProvider>(context, listen: false)
                                .darkTheme ==
                            true
                        ? 'assets/images/app_logo.png'
                        : 'assets/images/app_logo_black.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
