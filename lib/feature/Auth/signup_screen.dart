import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:project/constants/gaps.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/feature/Auth/constants/auth_button.dart';
import 'package:project/feature/Auth/login_screen.dart';
import 'package:project/feature/Auth/user_name_screen.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  void _onLoginTap(BuildContext context) {
    context.pushNamed(LoginScreen.routeName);
  }

  void _onEmailTap(BuildContext context) {
    context.push(UsernameScreen.routeURL);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
          vertical: Sizes.size40,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gaps.v20,
                Text(
                  "Sign up for TikTok",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Gaps.v5,
                const Text(
                  "Create a profile, follow other accounts, make your own videos, and more.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: Sizes.size16,
                  ),
                ),
                Gaps.v32,
                GestureDetector(
                  onTap: () => _onEmailTap(context),
                  child: const AuthButton(
                    text: "Use phone or email",
                    icon: FontAwesomeIcons.user,
                  ),
                ),
                Gaps.v16,
                const AuthButton(
                  text: "Continue with Facebook",
                  icon: FontAwesomeIcons.facebook,
                ),
                Gaps.v16,
                const AuthButton(
                  text: "Continue with Apple",
                  icon: FontAwesomeIcons.apple,
                ),
                Gaps.v16,
                const AuthButton(
                  text: "Continue with Google",
                  icon: FontAwesomeIcons.google,
                ),
              ],
            ),
            Positioned(
              bottom: Sizes.size80,
              left: 0,
              right: 0,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "By continunig, you agree to our ",
                  style: TextStyle(
                    color: Colors.black38,
                  ),
                  children: [
                    TextSpan(
                      text: "Terms of Service ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "and acknowledge that you have read our ",
                    ),
                    TextSpan(
                      text: "Privacy Policy ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text:
                          "to learn how ee collect, use, and share your data.",
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomSheet: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Already have an account?'),
            Gaps.h10,
            GestureDetector(
              onTap: () => _onLoginTap(context),
              child: const Text(
                "Log in",
                style: TextStyle(
                  color: Color(
                    0xFFC62828,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
