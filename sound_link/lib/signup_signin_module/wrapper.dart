import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../home_screen_module/home_screen.dart';
import '../splash_screen/splash_screen.dart';
import '../utils/authentication_backend.dart';
import '../utils/page_switcher.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (Provider.of<AuthUtil>(context).status) {
      case Status.unauthenticated:
        return Provider.of<PageSwitcher>(context).getPage;
      case Status.authenticated:
        return const HomeScreen();
      default:
        return const SplashScreen();
    }
  }
}
