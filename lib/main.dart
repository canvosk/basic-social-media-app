import 'package:basic_social_media_app/config/routes/routes.dart';
import 'package:basic_social_media_app/config/theme/app_theme.dart';
import 'package:basic_social_media_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: routes,
            title: 'Material App',
            theme: theme(),
          );
        });
  }
}
