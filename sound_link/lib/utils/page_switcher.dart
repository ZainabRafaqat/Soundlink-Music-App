import 'package:flutter/material.dart';

import '../splash_screen/onboarding_screen.dart';
import '../signup_signin_module/main_page.dart';
import '../signup_signin_module/sign_in_page.dart';
import '../signup_signin_module/sign_up_page.dart';

enum PageStatus { onBoardingScreen, mainPage, signInPage, signUpPage }

class PageSwitcher with ChangeNotifier {
  late PageStatus _pageStatus;
  late Widget _page;

  Widget get getPage => _page;
  PageStatus get getPageStatus => _pageStatus;

  PageSwitcher.instance() {
    _pageStatus = PageStatus.onBoardingScreen;
    _page = const OnBoardingScreen();
  }

  void gotoOnBoardingScreen() {
    _pageStatus = PageStatus.onBoardingScreen;
    _page = const OnBoardingScreen();
    notifyListeners();
  }

  void gotoSignInPage() {
    _page = const SignInPage();
    _pageStatus = PageStatus.signInPage;
    notifyListeners();
  }

  void gotoSignUpPage() {
    _page = const SignUpPage();
    _pageStatus = PageStatus.signUpPage;
    notifyListeners();
  }

  void gotoMainPage() {
    _page = const MainPage();
    _pageStatus = PageStatus.mainPage;
    notifyListeners();
  }
}
