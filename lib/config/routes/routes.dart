import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/pages/auth_pages/login_page/login_page.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/pages/auth_pages/register_page/register_page.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/pages/base_page.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/pages/management_page/management_page.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/pages/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const BasePage(pageContent: SplashScreen()),
    ),
    GoRoute(
      path: '/login-page',
      builder: (context, state) => const BasePage(pageContent: LoginPage()),
    ),
    GoRoute(
      path: '/register-page',
      builder: (context, state) => const BasePage(pageContent: RegisterPage()),
    ),
    GoRoute(
      path: '/management-page',
      builder: (context, state) => const ManagementPage(),
    ),
  ],
);
