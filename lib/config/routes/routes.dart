import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_management_entity.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/pages/auth_pages/login_page/login_page.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/pages/auth_pages/register_page/register_page.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/pages/base_page.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/pages/management_page/management_page.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/pages/profile_page/widgets/followers_detail.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/pages/profile_page/widgets/following_detail.dart';
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
    GoRoute(
      path: '/following-detail-page',
      builder: (context, state) => BasePage(
          pageContent: FollowingDetailWidget(
        user: state.extra as UserManagementEntity,
      )),
    ),
    GoRoute(
      path: '/followers-detail-page',
      builder: (context, state) =>
          const BasePage(pageContent: FollowersDetailWidget()),
    ),
  ],
);
