import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/local_storage_bloc/local_storage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LocalStorageBloc>().add(const GetString("userId"));

    return BlocListener<LocalStorageBloc, LocalStorageState>(
      listener: (context, state) {
        if (state is UserExist) {
          context.go('/management-page');
        } else if (state is NoUser) {
          context.go('/login-page');
        }
      },
      child: const Center(
        child: CircularProgressIndicator(
          color: golbat140,
        ),
      ),
    );
  }
}
