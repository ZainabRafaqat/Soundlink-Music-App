class Validators {
  static String? personNameValidator(String? name) {
    String patttern = r"[a-zA-Z][a-zA-Z]*$";
    RegExp regExp = RegExp(patttern);
    if (name == null || name.isEmpty || name.trim().isEmpty) {
      return 'This field is required';
    }
    if (!regExp.hasMatch(name.trim())) {
      return 'Please enter valid name';
    }
    return null;
  }

  static String? emailValidator(String? email) {
    String patttern = r"[a-zA-Z_][a-zA-Z0-9_.]*[@][a-zA-Z]+[.]com$";
    RegExp regExp = RegExp(patttern);
    if (email == null || email.isEmpty || email.trim().isEmpty) {
      return 'This field is required';
    }
    if (!regExp.hasMatch(email.trim())) {
      return 'Please enter valid email!';
    }
    return null;
  }

  static String? userNameValidator(String? username) {
    String patttern = r"[_a-zA-Z][a-zA-Z_.0-9]*$";
    RegExp regExp = RegExp(patttern);
    if (username == null || username.isEmpty || username.trim().isEmpty) {
      return 'This field is required';
    } else if (!regExp.hasMatch(username)) {
      return 'Please enter valid name';
    } else if (username.length < 6) {
      return 'Username must be atleast 6 characthers in length';
    }
    return null;
  }

  static String? passwordValidator(String? pass) {
    if (pass == null || pass.isEmpty) {
      return 'This field is required';
    } else if (pass.trim().length < 6) {
      return 'Password must be at least 6 characters in length - No White Spaces';
    }
    return null;
  }

  static String? confirmPasswordValidator(String? pass1, String? pass2) {
    if (pass1 == null || pass1.isEmpty) {
      return 'This field is required';
    }
    if (pass2 == null || pass2.isEmpty) {
      return 'This field is required';
    }
    if (pass1 != pass2) {
      return "Passwords don't match!";
    }
    return null;
  }

  static String? phoneNumberValidator(String? phone) {
    String patttern = r'[+]?[0-9]{11}$';
    RegExp regExp = RegExp(patttern);
    if (phone == null || phone.isEmpty || phone.trim().isEmpty) {
      return 'Please enter phone number';
    } else if (!regExp.hasMatch(phone.trim())) {
      return 'Please enter valid phone number';
    } else if ((phone.length != 11)) {
      return 'Please enter valid phone number - 11 Digits';
    }
    return null;
  }
}
