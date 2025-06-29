import 'package:go_router/go_router.dart';

import '../../features/auth/login/presentation/view/login_view.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/onboarding/presentation/view/onboarding_view.dart';
import '../../features/splash/presentation/view/splash_view.dart';

abstract class AppRoutes {
  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const forgotPassword = '/forgotPassword';
}

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: AppRoutes.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/onboarding',
      name: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: '/login',
      name: AppRoutes.login,
      builder: (context, state) => const LoginView(),
    ),
    // GoRoute(
    //   path: '/forgotPassword',
    //   name: AppRoutes.forgotPassword,
    //   builder: (context, state) => const SigninView(),
    // ),
    // GoRoute(
    //   path: '/register',
    //   name: AppRoutes.register,
    //   builder: (context, state) => const RegisterView(),
    // ),
    GoRoute(
      path: '/home',
      name: AppRoutes.home,
      builder: (context, state) => const HomeView(),
    ),
  ],
);
