import 'package:email_validator/email_validator.dart';

String? emailValidator(String email){
  bool isValidEmail = EmailValidator.validate(email);
  if(isValidEmail){
    return null;
  }
  return "Incorrect E-mail";
}

String? passwordValidator(String password){
  if(password.length < 8){
    return "Password can be at least 8 characters";
  }
  return null;
}