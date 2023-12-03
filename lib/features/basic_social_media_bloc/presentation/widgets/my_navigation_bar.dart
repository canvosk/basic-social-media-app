import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/local_storage_bloc/local_storage_bloc.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/management_bloc/management_page_bloc.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/profile_page_bloc/profile_page_bloc.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/pages/home_page/home_page.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagementPageBloc, ManagementPageState>(
      builder: (localContext, state) {
        if (state is CurrentPageChanged) {
          return BottomNavigationBar(
            currentIndex: state.index,
            onTap: (i) {
              Widget content = i == 0
                  ? const HomePage()
                  : i == 1
                      ? Container(
                          color: Colors.red,
                        )
                      : const ProfilePage();

              context.read<ManagementPageBloc>().add(
                    ChangeSelectedPage(
                      i,
                      content,
                    ),
                  );

              final localStorageState = context.read<LocalStorageBloc>().state;

              debugPrint(localStorageState.toString());

              if (localStorageState is UserExist && i == 2) {
                BlocProvider.of<ProfilePageBloc>(context)
                    .add(GetUserInformation(localStorageState.userId));
              }
            },
            selectedItemColor: Colors.red,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          );
        } else {
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          );
        }
      },
    );
  }
}
