import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/config/theme/text_styles.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entity.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/local_storage_bloc/local_storage_bloc.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/pages/auth_pages/login_page/widgets/text_widgets.dart';
import 'package:basic_social_media_app/injection_container.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    Widget buttonChild = Text(
      "Login",
      style: bodyXLargeText(bgColor),
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 32.w),
      child: BlocProvider(
        create: (context) => LoginBloc(sl()),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              buttonChild = Text(
                "Login",
                style: bodyXLargeText(bgColor),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Giriş Yapıldı!')),
              );

              BlocProvider.of<LocalStorageBloc>(context).add(SetString('userId', state.user.userId));

              Future.delayed(const Duration(seconds: 1), () {
                return context.go("/management-page");
              });
            } else if (state is LoginLoading) {
              buttonChild = const Center(
                child: CircularProgressIndicator(
                  color: bgColor,
                  strokeWidth: 3,
                ),
              );
            } else if (state is LoginFailed) {
              buttonChild = Text(
                "Login",
                style: bodyXLargeText(bgColor),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Giriş Yapılırken Bir Hata Oluştu!')),
              );
            }
          },
          child: Form(
            key: formKey,
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
                LoginPageTextWidgets(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                Column(
                  children: [
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.w),
                              ),
                              backgroundColor: headerTextColor,
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width, 50.h)),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              UserEntity myUser = UserEntity.empty;
                              myUser = myUser.copyWith(
                                email: emailController.text,
                                password: passwordController.text,
                              );

                              context.read<LoginBloc>().add(Login(
                                    myUser,
                                  ));
                            }
                          },
                          child: buttonChild,
                        );
                      },
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
          ),
        ),
      ),
    );
  }
}
