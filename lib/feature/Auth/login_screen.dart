import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:project/constants/gaps.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/feature/Auth/constants/auth_button.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  static const routeURL = "/login";
  static const routeName = "login";

  void _onSignupTap(BuildContext context) {
    context.pop();
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
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gaps.v20,
                Text(
                  "Log in to TikTok",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Gaps.v5,
                const Text(
                  "Manage your accoutn, check notifications, comment on videos, and more",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: Sizes.size16,
                  ),
                ),
                Gaps.v32,
                const AuthButton(
                  text: "Use phone / email / username",
                  icon: FontAwesomeIcons.user,
                ),
                Gaps.v16,
                const AuthButton(
                  text: "Continue with Facebook",
                  icon: FontAwesomeIcons.facebook,
                ),
                Gaps.v16,
                const AuthButton(
                  text: "Continue with Google",
                  icon: FontAwesomeIcons.google,
                ),
                Gaps.v96,
                Gaps.v96,
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: Sizes.size80,
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
            ),
          ],
        ),
      ),
      bottomSheet: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account?"),
            Gaps.h10,
            GestureDetector(
              onTap: () => _onSignupTap(context),
              child: const Text(
                "Sign up",
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
