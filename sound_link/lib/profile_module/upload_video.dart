import 'dart:ui';

import 'package:flutter/material.dart';

class UploadVideo extends StatefulWidget {
  const UploadVideo({Key? key}) : super(key: key);

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  bool _fabIsVisible = true;

  //  return SizedBox(
  //             height: MediaQuery.of(context).size.height * 0.4,
  //             width: MediaQuery.of(context).size.width,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: const [
  //                 Text("Category"),
  //               ],
  //             ),
  //           );

  @override
  Widget build(BuildContext context) {
    _showBottomSheet() {
      showModalBottomSheet(
          context: context,
          builder: (context) => ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 16.0,
                    sigmaY: 16.0,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
              ));
    }

    return AnimatedOpacity(
      opacity: _fabIsVisible ? 1 : 0,
      duration: const Duration(milliseconds: 100),
      child: SizedBox(
        height: 60,
        width: 130,
        child: FloatingActionButton(
          onPressed: () {
            _showBottomSheet();
          },
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.9,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: BorderSide(
              width: 2,
              color: Theme.of(context).primaryColor,
            ),
          ),
          child: Text(
            'Upload Video',
            style: Theme.of(context).textTheme.button!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
