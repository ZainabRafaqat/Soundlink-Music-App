import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/theme/theme_control.dart';
import '/utils/page_switcher.dart';
import '/utils/authentication_backend.dart';

import './widgets/credentials_input.dart';

import '../signup_signin_module/widgets/heading.dart';
import '../signup_signin_module/widgets/sign_up_specific_credentials.dart';
import '../signup_signin_module/widgets/bottom_logo.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _emailHandler = TextEditingController();
  final TextEditingController _passwordHandler = TextEditingController();
  final TextEditingController _userNameHandler = TextEditingController();
  void _onDoneClicked() async {
    if (_key.currentState!.validate()) {
      await Provider.of<AuthUtil>(context, listen: false).signUp(
          name: _userNameHandler.text.trim(),
          email: _emailHandler.text.trim(),
          password: _passwordHandler.text.trim(),
          date: DateTime.now().toString());
      setState(() {
        Provider.of<PageSwitcher>(context, listen: false).gotoMainPage();
      });
    }
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
                  child: Heading(
                    pageTitle: 'Sign Up',
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
                Container(
                  padding: EdgeInsets.zero,
                  height: mQuery * 0.45,
                  child: Form(
                    key: _key,
                    child: CredentialsInput(
                      title2: "Create a password",
                      title1: "Your email",
                      title3: 'Your username',
                      field1Handler: _emailHandler,
                      field2Handler: _passwordHandler,
                      field3Handler: _userNameHandler,
                      signUpPageCredentials: true,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.zero,
                  height: mQuery * 0.29,
                  child: SignUpSpecificCredentials(
                    onPressed: _onDoneClicked,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: mQuery * 0.11,
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
