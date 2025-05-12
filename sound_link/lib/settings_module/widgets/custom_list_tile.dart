import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '/theme/theme_control.dart';

class CustomListTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool? switchflag;
  final VoidCallback? onPressed_;
  const CustomListTile(
      {Key? key,
      required this.title,
      required this.subtitle,
      this.switchflag,
      this.onPressed_})
      : super(key: key);

  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).backgroundColor,
      elevation: 0,
      child: widget.switchflag == false
          ? ListTile(
              onTap: widget.onPressed_,
              title: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 18),
              ),
              subtitle: Text(
                widget.subtitle,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.grey.shade500,
                    ),
              ),
            )
          : SwitchListTile(
              activeColor: Theme.of(context).primaryColor,
              inactiveThumbColor: Theme.of(context).primaryColor,
              value: Provider.of<DarkThemeProvider>(context, listen: false)
                  .darkTheme,
              onChanged: (val) {
                setState(() {
                  Provider.of<DarkThemeProvider>(context, listen: false)
                      .darkTheme = val;
                });
              },
              title: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 18),
              ),
              subtitle: Text(
                widget.subtitle,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: const Color.fromRGBO(112, 112, 112, 1.0),
                    ),
              ),
            ),
    );
  }
}
