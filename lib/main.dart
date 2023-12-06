import 'package:basic_social_media_app/config/routes/routes.dart';
import 'package:basic_social_media_app/config/theme/app_theme.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/data/data_sources/local/local_storage_services.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/follow_user_bloc/follow_user_bloc.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/local_storage_bloc/local_storage_bloc.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/profile_page_bloc/profile_page_bloc.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/search_page_bloc/search_page_bloc.dart';
import 'package:basic_social_media_app/firebase_options.dart';
import 'package:basic_social_media_app/injection_container.dart';
import 'package:basic_social_media_app/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await LocalStorageService().init();

  Bloc.observer = SimpleBlocObserver();

  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<LocalStorageBloc>(
                create: (context) => LocalStorageBloc(sl()),
              ),
              BlocProvider<ProfilePageBloc>(
                create: (context) => ProfilePageBloc(sl(), sl()),
              ),
              BlocProvider<SearchPageBloc>(
                create: (context) => SearchPageBloc(sl()),
              ),
              BlocProvider<FollowUserBloc>(
                create: (context) => FollowUserBloc(sl()),
              ),
            ],
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: routes,
              title: 'Material App',
              theme: theme(),
            ),
          );
        });
  }
}
