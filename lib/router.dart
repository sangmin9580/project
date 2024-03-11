import 'package:go_router/go_router.dart';

import 'package:project/feature/Auth/login_screen.dart';
import 'package:project/feature/Auth/password_screen.dart';
import 'package:project/feature/Auth/signup_screen.dart';
import 'package:project/feature/Auth/user_name_screen.dart';
import 'package:project/feature/onboarding/interest/%08view/interest_screen.dart';
import 'package:project/navigation/main_navigation.dart';

final GoRouter router = GoRouter(
  initialLocation: InterestScreen.routeURL,
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: LoginScreen.routeURL,
      name: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: UsernameScreen.routeURL,
      name: UsernameScreen.routeName,
      builder: (context, state) => const UsernameScreen(),
    ),
    GoRoute(
      path: PasswordScreen.routeURL,
      name: PasswordScreen.routeName,
      builder: (context, state) => const PasswordScreen(),
    ),
    GoRoute(
      path: InterestScreen.routeURL,
      name: InterestScreen.routeName,
      builder: (context, state) => const InterestScreen(),
    ),
    GoRoute(
      path: MainNavigationScreen.routeURL,
      name: MainNavigationScreen.routeName,
      builder: (context, state) => const MainNavigationScreen(),
    )
  ],
);
