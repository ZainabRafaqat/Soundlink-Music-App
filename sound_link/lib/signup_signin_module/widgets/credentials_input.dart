import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '/theme/theme_control.dart';
import '/utils/validations.dart';

import './text_field_custom.dart';

class CredentialsInput extends StatelessWidget {
  final String title1;
  final String title2;
  final String? title3;
  final TextEditingController field1Handler;
  final TextEditingController field2Handler;
  final TextEditingController? field3Handler;
  final bool signUpPageCredentials;
  const CredentialsInput({
    Key? key,
    required this.title2,
    required this.title1,
    required this.field1Handler,
    required this.field2Handler,
    this.field3Handler,
    this.title3,
    required this.signUpPageCredentials,
  }) : super(key: key);

  Widget getText(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
      child: Text(
        text,
        style: TextStyle(
          letterSpacing: 0,
          color: Provider.of<DarkThemeProvider>(context, listen: false)
                      .darkTheme ==
                  false
              ? Colors.black
              : Colors.white,
          fontSize: 16,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getText(context, title1),
          TextFieldCustom(
            validatorFunction: Validators.emailValidator,
            textEditingController: field1Handler,
            placeHolder: 'Enter email',
            textInputType: TextInputType.emailAddress,
            isPasswordField: false,
          ),
          getText(context, title2),
          TextFieldCustom(
            validatorFunction: Validators.passwordValidator,
            textEditingController: field2Handler,
            placeHolder: 'Enter password',
            textInputType: TextInputType.visiblePassword,
            isPasswordField: true,
          ),
          if (signUpPageCredentials == true && title3 != null)
            getText(context, title3!),
          if (signUpPageCredentials == true && field3Handler != null)
            TextFieldCustom(
              validatorFunction: Validators.userNameValidator,
              textEditingController: field3Handler!,
              placeHolder: 'Enter username',
              textInputType: TextInputType.name,
              isPasswordField: false,
            ),
        ],
      ),
    );
  }
}
