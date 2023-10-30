import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/config/theme/text_styles.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/widgets/my_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 32.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: headingText(headerTextColor),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "Basic Social Media App",
                    style: bodyLargeText(normalTextColor),
                  ),
                ],
              ),
              Column(
                children: [
                  MyTextField(
                    controller: emailController,
                    hintText: "E-mail",
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 12.w),
                      child: const Icon(
                        Icons.cancel,
                        color: golbat140,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  MyTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 12.w),
                      child: const Icon(
                        Icons.cancel,
                        color: golbat140,
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
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.w),
                        ),
                        backgroundColor: headerTextColor,
                        fixedSize:
                            Size(MediaQuery.of(context).size.width, 50.h)),
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: bodyXLargeText(bgColor),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "",
                      children: [
                        const TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(color: normalTextColor)),
                        TextSpan(
                            text: "Create Account",
                            style: const TextStyle(color: linkColor),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
