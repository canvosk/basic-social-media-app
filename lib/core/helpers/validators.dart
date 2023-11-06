import 'package:email_validator/email_validator.dart';

RegExp nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
final RegExp numberRegExp = RegExp(r'\d');

String? emailValidator(String email) {
  bool isValidEmail = EmailValidator.validate(email);
  if (isValidEmail) {
    return null;
  }
  return "Incorrect E-mail";
}

String? passwordValidator(String password) {
  if (password.length < 8) {
    return "Password can be at least 8 characters";
  }
  return null;
}

String? nameValidator(String name) {
  if (name.isEmpty) {
    return "Enter your name";
  } else if (nameRegExp.hasMatch(name)) {
    // if(numberRegExp.hasMatch(name)){
    //   return "Name cannot contain numbers";
    // }
    return null;
  } else {
    return "Enter a valid name";
  }

  // return name.isEmpty
  //     ? "Enter your name"
  //     : nameRegExp.hasMatch(name)
  //         ? null
  //         : "Enter a valid name";
}
