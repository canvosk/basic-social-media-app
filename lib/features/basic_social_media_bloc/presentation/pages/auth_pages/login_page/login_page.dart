import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/config/theme/text_styles.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/pages/auth_pages/login_page/widgets/text_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {


    return Padding(
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
          const LoginPageTextWidgets(),
          Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.w),
                    ),
                    backgroundColor: headerTextColor,
                    fixedSize: Size(MediaQuery.of(context).size.width, 50.h)),
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
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.push('/register-page');
                          }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

