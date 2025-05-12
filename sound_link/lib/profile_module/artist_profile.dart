import 'package:flutter/material.dart';

import '../home_screen_module/carousel_builder.dart';
import '../home_screen_module/image_container.dart';
import '../models/image_data.dart';

class ArtistProfile extends StatefulWidget {
  const ArtistProfile({Key? key}) : super(key: key);

  @override
  State<ArtistProfile> createState() => _ArtistProfileState();
}

class _ArtistProfileState extends State<ArtistProfile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageContainer(
                height: MediaQuery.of(context).size.height * 0.5,
                list: imageArr,
                isArtistPage: true),
            CarouselBuilder(
                str: "For You",
                height: MediaQuery.of(context).size.height * 0.35,
                list: imageArr),
            CarouselBuilder(
                str: "Popular",
                height: MediaQuery.of(context).size.height * 0.35,
                list: imageArr),
          ],
        ),
      ),
    );
  }
}
