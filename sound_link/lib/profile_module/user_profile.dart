import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../profile_module/upload_video.dart';

import '../profile_module/video_items.dart';
import '../theme/theme_control.dart';
import '../models/image_data.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late double _height;
  late ScrollController _scrollController;
  bool _isVisible = true;
  bool isScrollingDown = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _isVisible = false;
          setState(() {});
        }
      }

      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _isVisible = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: Theme.of(context).textTheme.headline5,
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          bottomOpacity: 0.0,
          // leading: IconButton(
          //     icon: const Icon(Icons.arrow_back_ios,
          //         color: Colors.black, size: 15),
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => const HomeScreen()));
          //     }),
          actions: [
            Switch(
              value: Provider.of<DarkThemeProvider>(context, listen: false)
                  .darkTheme,
              onChanged: (val) {
                setState(() {
                  Provider.of<DarkThemeProvider>(context, listen: false)
                      .darkTheme = val;
                });
              },
            ),
          ],
        ),
        floatingActionButton: const UploadVideo(),
        body: Container(
          height: _height,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              AnimatedBuilder(
                animation: _scrollController,
                builder: (context, child) {
                  return SizedBox(
                    height: !_isVisible ? 0 : _height * 0.15,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/images/splash_screen/splash_screen18.jpg"),
                          radius: 80,
                        ),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                              text: "Naba Ali",
                              style: Theme.of(context).textTheme.headline5,
                              children: <TextSpan>[
                                TextSpan(
                                  text: "\n2 Followers  .  12 Followings",
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ]),
                        ),
                        // ),
                      ],
                    ),
                  );
                },
              ),
              TabBar(
                indicatorColor: Theme.of(context).primaryColor,
                labelStyle: Theme.of(context).textTheme.button,
                labelColor:
                    Provider.of<DarkThemeProvider>(context, listen: false)
                                .darkTheme ==
                            true
                        ? Colors.white
                        : Colors.black,
                tabs: const [
                  Tab(text: "Favorites (11)"),
                  Tab(text: "Uploaded (5)"),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                height: !_isVisible ? _height * 0.83 : _height * 0.73,
                child: TabBarView(
                  children: [
                    VideoItems(
                        arr: imageArr,
                        scrollController: _scrollController,
                        crossAxisCount: 2,
                        scrollDirection: Axis.vertical),
                    VideoItems(
                        arr: imageArr,
                        scrollController: _scrollController,
                        crossAxisCount: 2,
                        scrollDirection: Axis.vertical),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
