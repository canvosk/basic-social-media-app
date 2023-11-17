import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/core/helpers/validators.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPageTextWidgets extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginPageTextWidgets({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<LoginPageTextWidgets> createState() => _LoginPageTextWidgetsState();
}

class _LoginPageTextWidgetsState extends State<LoginPageTextWidgets> {
  
  bool isObscured = true;


  setVisible() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  clearEmail() {
    widget.emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(
          validator: (string) => emailValidator(widget.emailController.text),
          controller: widget.emailController,
          hintText: "E-mail",
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(
            Icons.email_outlined,
            color: golbat140,
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: GestureDetector(
              onTap: () => clearEmail,
              child: const Icon(
                Icons.cancel,
                color: golbat140,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        MyTextField(
          validator: (string) => passwordValidator(widget.passwordController.text),
          controller: widget.passwordController,
          hintText: "Password",
          obscureText: isObscured,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(
            Icons.lock,
            color: golbat140,
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: GestureDetector(
              onTap: () => setVisible(),
              child: const Icon(
                Icons.remove_red_eye,
                color: golbat140,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Forgot password?",
              style: TextStyle(
                color: normalTextColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
