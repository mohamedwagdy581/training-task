import 'package:go_router/go_router.dart';

import '../../features/auth/login/presentation/view/login_view.dart';
import '../../features/home/data/product_model.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/product_details_view.dart';
import '../../features/onboarding/presentation/view/onboarding_view.dart';
import '../../features/splash/presentation/view/splash_view.dart';

abstract class AppRoutes {
  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const productDetails = '/productDetails';
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
    GoRoute(
      path: '/productDetails',
      name: AppRoutes.productDetails,
      builder: (context, state) 
      {
    final product = state.extra as ProductModel; // أو as ProductModel
    return ProductDetailsView(product: product);
      },
    ),
  ],
);
