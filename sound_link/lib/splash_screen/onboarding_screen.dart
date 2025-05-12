import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../utils/page_switcher.dart';
import '../splash_screen/screen1.dart';
import '../splash_screen/screen2.dart';
import '../splash_screen/screen3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;
  late Color _textColor;
  late PageController _controller;

  final List<Widget> _pages = [
    const ScreenOne(),
    const ScreenTwo(),
    const ScreenThree(),
  ];

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _setColor(index, currentPage) {
    late Color color;

    if (index == currentPage) {
      color = Colors.black;
      _textColor = color;

      if (index == 1) {
        color = Colors.white;
        _textColor = color;
      }
    } else {
      if (currentPage == 0 || currentPage == 2) {
        color = Colors.black.withOpacity(0.6);
      } else {
        color = Colors.grey.withOpacity(0.4);
      }
    }
    return color;
  }

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: _onChanged,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(width: 20),
              Row(
                children: List<Widget>.generate(
                  _pages.length,
                  (int index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 10,
                      width: (index == _currentPage) ? 30 : 10,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: _setColor(index, _currentPage),
                      ),
                    );
                  },
                ),
              ),
              AnimatedContainer(
                duration: const Duration(minutes: 1),
                height: 70,
                width: (_currentPage == (_pages.length - 1)) ? 200 : 75,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      Provider.of<PageSwitcher>(context, listen: false)
                          .gotoMainPage();
                    });
                  },
                  child: Text(
                    _currentPage != _pages.length - 1 ? 'Skip' : 'Next',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: _textColor),
                  ),
                ),
              ),
              const SizedBox(height: 90)
            ],
          )
        ],
      ),
    );
  }
}
