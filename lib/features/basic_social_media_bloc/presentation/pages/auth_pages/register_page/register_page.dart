import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/config/theme/text_styles.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entitiy.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/pages/auth_pages/register_page/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    Widget buttonChild = Text(
      "Register",
      style: bodyXLargeText(bgColor),
    );

    final formKey = GlobalKey<FormState>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            buttonChild = Text(
              "Register",
              style: bodyXLargeText(bgColor),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Kayıt Olundu!')),
            );
            Future.delayed(const Duration(seconds: 1), () {
              return context.go("/home-page");
            });
          } else if (state is Registering) {
            buttonChild = const Center(
              child: CircularProgressIndicator(
                color: bgColor,
                strokeWidth: 3,
              ),
            );
          } else if (state is RegisterFailed) {
            buttonChild = Text(
              "Register",
              style: bodyXLargeText(bgColor),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Kayıt Olurken Bir Hata Oluştu!')),
            );
          }
        },
        child: Form(
          key: formKey,
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
                      RegisterPageTextWidgets(
                        nameController: nameController,
                        emailController: emailController,
                        passwordController: passwordController,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      BlocBuilder<RegisterBloc, RegisterState>(
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
                                UserEntitiy myUser = UserEntitiy.empty;
                                myUser = myUser.copyWith(
                                  email: emailController.text,
                                  name: nameController.text,
                                  password: passwordController.text,
                                );

                                context.read<RegisterBloc>().add(Register(
                                      myUser,
                                    ));
                              }
                            },
                            child: buttonChild,
                          );
                        },
                      ),
                    ],
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
