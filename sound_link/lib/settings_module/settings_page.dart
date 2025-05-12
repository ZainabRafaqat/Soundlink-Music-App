import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../signup_signin_module/widgets/custom_icon_back_button.dart';
import '../settings_module/widgets/settings_page_credentials.dart';
import '../signup_signin_module/widgets/bottom_logo.dart';
import '../theme/theme_control.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var mQuery =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: mQuery,
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.all(1.0),
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: CustomIconBackButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                SizedBox(
                  height: mQuery * 0.83,
                  child: const SettingsPageCredentials(),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: mQuery * 0.11,
                  child: BottomLogo(
                    flag: true,
                    path: Provider.of<DarkThemeProvider>(context, listen: false)
                                .darkTheme ==
                            true
                        ? 'assets/images/app_logo.png'
                        : 'assets/images/app_logo_black.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
