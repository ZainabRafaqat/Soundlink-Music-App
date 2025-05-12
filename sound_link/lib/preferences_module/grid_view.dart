import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../preferences_module/selection_button.dart';
import '../theme/theme_control.dart';

class GridViewBuilder extends StatelessWidget {
  final List<String> list;
  final double itemWidth;
  final double itemHeight;

  const GridViewBuilder(
      {Key? key,
      required this.list,
      required this.itemWidth,
      required this.itemHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: (itemWidth / itemHeight),
        ),
        itemBuilder: (ctx, index) => SelectionButton(
            str: list[index],
            textColor: Provider.of<DarkThemeProvider>(context).darkTheme == true
                ? Theme.of(context).primaryColor
                : Theme.of(context).backgroundColor,
            buttonColor:
                Provider.of<DarkThemeProvider>(context).darkTheme == true
                    ? Theme.of(context).backgroundColor
                    : Theme.of(context).primaryColor,
            borderColor:
                Provider.of<DarkThemeProvider>(context).darkTheme == true
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).backgroundColor,
            size: null,
            func: () {}),
        itemCount: list.length,
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
