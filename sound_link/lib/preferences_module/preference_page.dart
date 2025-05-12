import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../preferences_module/selection_button.dart';
import '../preferences_module/grid_view.dart';
import '../theme/theme_control.dart';

class PreferencePage extends StatefulWidget {
  const PreferencePage({Key? key}) : super(key: key);

  @override
  State<PreferencePage> createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  final List<String> mood = const [
    'Move',
    'Chill',
    'Relaxing',
    'Angry',
    'Beach Time',
    'Relaxing',
    'For the Anxious',
    'Move'
  ];

  final List<String> occasion = const [
    'Party',
    'Breakup',
    "Valentine's",
    'Angry',
    'Gym',
    'Relaxing',
    'For the Anxious',
    'Move'
  ];

  final List<String> genres = const [
    'Classic',
    'Pop',
    'Rock',
    'Metal',
    'Hip Hop',
    'Electronic',
    'Jazz',
    'Rap',
    'Country'
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height * 0.34 - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
        appBar: AppBar(
          leading: null,
          toolbarHeight: 88,
          title: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
                text: "Preferences",
                style: Theme.of(context).textTheme.headline5,
                children: <TextSpan>[
                  TextSpan(
                    text: "\nAlter your preferences at any occasion",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ]),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          bottomOpacity: 0.0,
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
            )
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mood",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              GridViewBuilder(
                  list: mood, itemWidth: itemWidth, itemHeight: itemHeight),
              Text(
                "Occasion",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              GridViewBuilder(
                  list: occasion, itemWidth: itemWidth, itemHeight: itemHeight),
              Text(
                "Genres",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              GridViewBuilder(
                  list: genres, itemWidth: itemWidth, itemHeight: itemHeight),
              Center(
                  child: SelectionButton(
                      str: "Done",
                      textColor:
                          Provider.of<DarkThemeProvider>(context).darkTheme ==
                                  true
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).backgroundColor,
                      buttonColor:
                          Provider.of<DarkThemeProvider>(context).darkTheme ==
                                  true
                              ? Theme.of(context).backgroundColor
                              : Theme.of(context).primaryColor,
                      borderColor:
                          Provider.of<DarkThemeProvider>(context).darkTheme ==
                                  true
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).backgroundColor,
                      size: const Size(150, 50),
                      func: () => Navigator.pop(context))),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ));
  }
}
