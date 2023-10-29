import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/config/theme/text_styles.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

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
              SizedBox(
                height: 16.h,
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
