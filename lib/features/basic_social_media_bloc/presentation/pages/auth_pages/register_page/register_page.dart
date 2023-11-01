import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/config/theme/text_styles.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: golbat140,
              size: 30.w,
            ),
            onPressed: () {
              context.pop();
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 32.w),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Register",
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
                  SizedBox(
                    height: 16.h,
                  ),
                  Column(
                    children: [
                      MyTextField(
                        controller: emailController,
                        hintText: "Name",
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(
                          Icons.person,
                          color: golbat140,
                        ),
                        // suffixIcon: Padding(
                        //   padding: EdgeInsets.only(right: 12.w),
                        //   child: const Icon(
                        //     Icons.cancel,
                        //     color: golbat140,
                        //   ),
                        // ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      MyTextField(
                        controller: emailController,
                        hintText: "E-mail",
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: golbat140,
                        ),
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
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: golbat140,
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: const Icon(
                            Icons.remove_red_eye,
                            color: golbat140,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.w),
                        ),
                        backgroundColor: headerTextColor,
                        fixedSize: Size(MediaQuery.of(context).size.width, 50.h)),
                    onPressed: () {},
                    child: Text(
                      "Register",
                      style: bodyXLargeText(bgColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
