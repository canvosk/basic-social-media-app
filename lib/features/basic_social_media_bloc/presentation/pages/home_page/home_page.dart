import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/local_storage_bloc/local_storage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: BlocListener<LocalStorageBloc, LocalStorageState>(
              listener: (context, state) {
                if (state is NoUser) {
                  context.go('/login-page');
                }
              },
              child: IconButton(
                onPressed: () {
                  context.read<LocalStorageBloc>().add(const RemoveValue(
                        'userId',
                      ));
                },
                icon: const Icon(Icons.logout_rounded),
              ),
            ),
          ),
        )
      ],
    );
  }
}
