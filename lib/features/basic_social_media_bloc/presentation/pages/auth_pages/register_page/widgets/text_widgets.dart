import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/core/helpers/validators.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPageTextWidgets extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const RegisterPageTextWidgets({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<RegisterPageTextWidgets> createState() =>
      _RegisterPageTextWidgetsState();
}

class _RegisterPageTextWidgetsState extends State<RegisterPageTextWidgets> {
  bool isObscured = true;

  // final nameController = TextEditingController();
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();

  final IconData unVisibleIcon = Icons.visibility_off;
  final IconData visibleIcon = Icons.visibility;

  late IconData passwordSuffix = unVisibleIcon;

  setVisible() {
    setState(() {
      isObscured = !isObscured;
      isObscured ? passwordSuffix = unVisibleIcon : passwordSuffix = visibleIcon;
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
          controller: widget.nameController,
          validator: (name) => nameValidator(widget.nameController.text),
          hintText: "Name",
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(
            Icons.person,
            color: golbat140,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        MyTextField(
          controller: widget.emailController,
          validator: (string) => emailValidator(widget.emailController.text),
          hintText: "E-mail",
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(
            Icons.email_outlined,
            color: golbat140,
          ),
          suffixIcon: GestureDetector(
            onTap: clearEmail,
            child: Padding(
              padding: EdgeInsets.only(right: 12.w),
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
          controller: widget.passwordController,
          validator: (string) => passwordValidator(widget.passwordController.text),
          hintText: "Password",
          obscureText: isObscured,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(
            Icons.lock,
            color: golbat140,
          ),
          suffixIcon: GestureDetector(
            onTap: setVisible,
            child: Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: Icon(
                passwordSuffix,
                color: golbat140,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
