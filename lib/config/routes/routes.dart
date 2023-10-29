import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/pages/auth_pages/login_page/login_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      // path: '/login-page',
      builder: (context, state) => const LoginPage(),
    ),
    
  ],
);