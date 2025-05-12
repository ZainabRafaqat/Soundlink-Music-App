import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '/utils/authentication_backend.dart';

import './widgets/bottom_logo.dart';
import './widgets/icon_text_button.dart';
import './widgets/text_button_custom.dart';

import '../theme/theme_control.dart';
import '../utils/page_switcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isSigningInGoogle = false;
  bool _isSigningInFacebook = false;

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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Provider.of<DarkThemeProvider>(context, listen: false)
                          .darkTheme = !Provider.of<DarkThemeProvider>(context,
                              listen: false)
                          .darkTheme;
                    });
                  },
                  child: Container(
                    height: mQuery * 0.25,
                    margin: EdgeInsets.zero,
                    width: double.infinity,
                    child: Center(
                      child: Image.asset(
                        Provider.of<DarkThemeProvider>(context).darkTheme ==
                                true
                            ? 'assets/images/app_logo.png'
                            : 'assets/images/app_logo_black.png',
                      ),
                    ),
                  ),
                ),
                Container(
                  height: mQuery * 0.45,
                  width: double.infinity,
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Play your favourite songs and artists',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Segoe UI',
                          fontSize: 20,
                          color: Color.fromRGBO(112, 112, 112, 1.0),
                        ),
                      ),
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
                                text: 'Sign up with Facebook',
                              ),
                            ),
                      _isSigningInGoogle
                          ? getSigningInIndicator
                          : Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 5),
                              child: IconTextButton(
                                pathOfIcon: "assets/images/google_logo.png",
                                buttonColor: Provider.of<DarkThemeProvider>(
                                                context)
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
                                text: 'Sign up with Google',
                              ),
                            ),
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        child: TextButtonCustom(
                          size: MediaQuery.of(context).size.width * 0.7,
                          isEnabled: true,
                          textColor: Provider.of<DarkThemeProvider>(context,
                                          listen: false)
                                      .darkTheme ==
                                  true
                              ? Colors.white
                              : Colors.black,
                          borderColor: Provider.of<DarkThemeProvider>(context,
                                          listen: false)
                                      .darkTheme ==
                                  false
                              ? const Color.fromRGBO(178, 172, 172, 1.0)
                              : Colors.white,
                          onPressed: () {
                            setState(() {
                              Provider.of<PageSwitcher>(context, listen: false)
                                  .gotoSignUpPage();
                            });
                          },
                          text: 'Sign up with email',
                          isTextBold: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  height: mQuery * 0.17,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?  ',
                            style: TextStyle(
                              letterSpacing: 0,
                              fontFamily: 'Lato',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Provider.of<DarkThemeProvider>(context,
                                              listen: false)
                                          .darkTheme ==
                                      true
                                  ? Colors.white
                                  : const Color.fromRGBO(52, 51, 51, 1.0),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Provider.of<PageSwitcher>(context,
                                        listen: false)
                                    .gotoSignInPage();
                              });
                            },
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                letterSpacing: 0,
                                fontFamily: 'Lato',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Provider.of<DarkThemeProvider>(context,
                                                listen: false)
                                            .darkTheme ==
                                        true
                                    ? Colors.white
                                    : const Color.fromRGBO(52, 51, 51, 1.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: mQuery * 0.13,
                  child: BottomLogo(
                    flag: false,
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
