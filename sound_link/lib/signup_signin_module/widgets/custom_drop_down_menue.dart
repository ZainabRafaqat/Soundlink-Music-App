import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '/theme/theme_control.dart';

import 'country_and_gender_list.dart';

class CustomDropDownMenue extends StatefulWidget {
  const CustomDropDownMenue({Key? key}) : super(key: key);

  @override
  _DropDownMenueState createState() => _DropDownMenueState();
}

class _DropDownMenueState extends State<CustomDropDownMenue> {
  String countryvalue = 'Afghanistan';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            Provider.of<DarkThemeProvider>(context, listen: false).darkTheme ==
                    false
                ? const Color.fromRGBO(184, 242, 234, 0.84)
                : Colors.white70,
        border: Border.all(width: 2, color: Colors.transparent),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: DropdownButton(
        iconDisabledColor: Colors.blue,
        focusColor: Colors.blue,
        icon: const Icon(Icons.keyboard_arrow_down),
        value: countryvalue,
        borderRadius: const BorderRadius.all(Radius.circular(2.0)),
        items: country.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            countryvalue = newValue!;
          });
        },
      ),
    );
  }
}
