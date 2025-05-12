import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:sound_link/theme/theme_control.dart';

class CustomIconBackButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CustomIconBackButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        size: 28.0,
        color:
            Provider.of<DarkThemeProvider>(context, listen: false).darkTheme ==
                    false
                ? const Color.fromRGBO(178, 172, 172, 1.0)
                : Colors.white,
      ),
      onPressed: onPressed,
    );
  }
}
