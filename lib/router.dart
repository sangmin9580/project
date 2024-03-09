import 'package:go_router/go_router.dart';

import 'package:project/feature/Auth/login_screen.dart';
import 'package:project/feature/Auth/password_screen.dart';
import 'package:project/feature/Auth/signup_screen.dart';
import 'package:project/feature/Auth/user_name_screen.dart';

final GoRouter router = GoRouter(
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
    )
  ],
);
