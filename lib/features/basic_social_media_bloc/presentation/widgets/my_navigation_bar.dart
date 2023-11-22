import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/management_bloc/management_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagementPageBloc, ManagementPageState>(
      builder: (context, state) {
        if (state is CurrentPageChanged) {
          return BottomNavigationBar(
            currentIndex: state.index,
            onTap: (i) {
              context.read<ManagementPageBloc>().add(
                    ChangeSelectedPage(
                      i,
                      Container(
                        color: i == 0
                            ? Colors.blue
                            : i == 1
                                ? Colors.red
                                : Colors.black,
                      ),
                    ),
                  );
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
