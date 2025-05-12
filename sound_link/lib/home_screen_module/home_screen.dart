import 'package:flutter/material.dart';

import '../home_screen_module/carousel_builder.dart';
import '../home_screen_module/image_container.dart';

import '../settings_module/settings_page.dart';
import '../profile_module/user_profile.dart';
import '../search_module/search_page.dart';
import '../models/image_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double _height;

  void onBottomBarItemSelected(int index) {
    if (index == 0) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const SearchPage()));
    } else if (index == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const UserProfile()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const SettingsPage()));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height - kBottomNavigationBarHeight;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.5,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey.withOpacity(0.8),
        showUnselectedLabels: false,
        selectedFontSize: 15,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        onTap: (index) => onBottomBarItemSelected(index),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).backgroundColor,
          child: Column(
            children: [
              ImageContainer(
                  height: _height * 0.5, list: imageArr, isArtistPage: true),
              CarouselBuilder(
                  str: "For You", height: _height * 0.35, list: imageArr),
              CarouselBuilder(
                  str: "Popular", height: _height * 0.35, list: imageArr),
            ],
          ),
        ),
      ),
    );
  }
}
