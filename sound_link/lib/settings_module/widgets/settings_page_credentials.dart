import 'package:flutter/material.dart';

import '../../signup_signin_module/widgets/text_field_custom.dart';
import '../../settings_module/widgets/custom_list_tile.dart';

import '../../utils/validations.dart';

class SettingsPageCredentials extends StatefulWidget {
  const SettingsPageCredentials({Key? key}) : super(key: key);

  @override
  State<SettingsPageCredentials> createState() =>
      _SettingsPageCredentialsState();
}

class _SettingsPageCredentialsState extends State<SettingsPageCredentials> {
  TextEditingController controllerPassword = TextEditingController();

  void customDialog({bool? noInputFlag, bool? inputFlag, bool? passWordFlag}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.only(top: 40, left: 25),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(
            "Change Password",
            style: Theme.of(context).textTheme.headline5,
          ),
          content: inputFlag == true
              ? TextFieldCustom(
                  textEditingController: controllerPassword,
                  placeHolder: "Enter new password",
                  textInputType: TextInputType.visiblePassword,
                  isPasswordField: true,
                  validatorFunction: Validators.passwordValidator)
              : Text(
                  "Do you really want to change your password?",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
          actions: [
            Container(
              color: Colors.amber,
              // color: Theme.of(context).primaryColor,
              child: TextButton(
                  // style:const ButtonStyle( ),
                  child:
                      const Text("Done", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const CustomListTile(
          title: "Dark mode",
          subtitle: "currently on",
          switchflag: true,
        ),
        CustomListTile(
          title: "Password",
          subtitle: "Manage Password",
          switchflag: false,
          onPressed_: () {
            customDialog(inputFlag: false, passWordFlag: true);
          },
        ),
        const CustomListTile(
          title: "About",
          subtitle: "Know about us",
          switchflag: false,
        ),
        const CustomListTile(
          title: "Feedback",
          subtitle: "Give feedback",
          switchflag: false,
        ),
        const CustomListTile(
          title: "User Name",
          subtitle: "Change user name",
          switchflag: false,
        ),
        const CustomListTile(
          title: "Delete Account",
          subtitle: "Delete your account",
          switchflag: false,
        ),
        CustomListTile(
          title: "Sign out",
          subtitle: "Log out",
          switchflag: false,
          onPressed_: () {},
        ),
      ],
    );
  }
}
