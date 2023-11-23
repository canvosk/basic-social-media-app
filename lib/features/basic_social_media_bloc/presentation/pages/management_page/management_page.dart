import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/local_storage_bloc/local_storage_bloc.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/management_bloc/management_page_bloc.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/widgets/my_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ManagementPage extends StatelessWidget {
  const ManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManagementPageBloc()
        ..add(ChangeSelectedPage(
            0,
            Container(
              color: Colors.blue,
            ))),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ManagementPageBloc, ManagementPageState>(
            key: UniqueKey(),
            buildWhen: (previousState, currentState) {
              debugPrint("Previous: $previousState");
              debugPrint("Current: $currentState");
              return currentState is CurrentPageChanged;
            },
            builder: (context, state) {
              debugPrint(state.toString());
              if (state is CurrentPageChanged) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child:
                            BlocListener<LocalStorageBloc, LocalStorageState>(
                          listener: (context, state) {
                            if (state is NoUser) {
                              context.go('/login-page');
                            }
                          },
                          child: IconButton(
                            onPressed: () {
                              context
                                  .read<LocalStorageBloc>()
                                  .add(const RemoveValue(
                                    'userId',
                                  ));
                            },
                            icon: const Icon(Icons.logout_rounded),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: state.content),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child:
                            BlocListener<LocalStorageBloc, LocalStorageState>(
                          listener: (context, state) {
                            if (state is NoUser) {
                              context.go('/login-page');
                            }
                          },
                          child: IconButton(
                            onPressed: () {
                              context
                                  .read<LocalStorageBloc>()
                                  .add(const RemoveValue(
                                    'userId',
                                  ));
                            },
                            icon: const Icon(Icons.logout_rounded),
                          ),
                        ),
                      ),
                    ),
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              }
            },
          ),
        ),
        bottomNavigationBar: const MyBottomNavigationBar(),
      ),
    );
  }
}
