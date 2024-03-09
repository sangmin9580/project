import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:project/constants/gaps.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/feature/Auth/birthday_screen.dart';
import 'package:project/feature/Auth/constants/form_button.dart';

class PasswordScreen extends ConsumerStatefulWidget {
  const PasswordScreen({super.key});

  static const routeURL = '/password';
  static const routeName = 'password';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends ConsumerState<PasswordScreen> {
  void _onSkipTap() {
    context.pop();
  }

  final TextEditingController _passwordController = TextEditingController();

  String _password = '';
  bool _isObscured = true;
  Color lengthColor = Colors.grey.shade700;
  Color regColor = Colors.grey.shade700;
  final regExp = RegExp(
      r"^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@$!%*#?&\^])[A-Za-z0-9@$!%*#?&\^]{9,}$");
  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      _password = _passwordController.text;
      _passwordLengthCheck();
      _passwordRegCheck();
      setState(() {});
    });
  }

  void _passwordLengthCheck() {
    if (_password.length >= 8 && _password.length <= 20) {
      lengthColor = Colors.green.shade200;
    } else {
      lengthColor = Colors.grey.shade700;
    }
    setState(() {});
  }

  void _passwordRegCheck() {
    if (regExp.hasMatch(_password)) {
      regColor = Colors.green.shade200;
    } else {
      regColor = Colors.grey.shade700;
    }
    setState(() {});
  }

  void _onNextTap() {
    if (_password.isEmpty || !regExp.hasMatch(_password)) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  void _onClickedEyeslash() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: GestureDetector(
          onTap: _onSkipTap,
          child: Container(
            padding: const EdgeInsets.only(
              left: Sizes.size10,
            ),
            alignment: Alignment.center,
            child: const Text(
              "SKIP",
              style: TextStyle(
                color: Colors.black38,
                fontSize: Sizes.size20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        title: const Text(
          "Sign up",
        ),
        actions: const [
          FaIcon(
            FontAwesomeIcons.question,
            color: Colors.black45,
          ),
          Gaps.h20,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size28,
          vertical: Sizes.size20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create password",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Gaps.v40,
            TextField(
              obscureText: _isObscured,
              textAlignVertical: TextAlignVertical.center,
              controller: _passwordController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                  left: Sizes.size20,
                  right: Sizes.size10,
                  bottom: Sizes.size20,
                ),
                suffix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: _passwordController.clear,
                      child: const FaIcon(
                        FontAwesomeIcons.xmark,
                      ),
                    ),
                    Gaps.h20,
                    GestureDetector(
                      onTap: _onClickedEyeslash,
                      child: FaIcon(
                        _isObscured
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gaps.v10,
            Text(
              "Your password nust have:",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Gaps.v5,
            Column(
              children: [
                Row(
                  children: [
                    TweenAnimationBuilder(
                      tween: ColorTween(
                        begin: Colors.grey.shade700,
                        end: lengthColor,
                      ),
                      duration: const Duration(
                        milliseconds: 100,
                      ),
                      builder: (context, color, child) => FaIcon(
                        FontAwesomeIcons.circleCheck,
                        size: Sizes.size20,
                        color: color,
                      ),
                    ),
                    Gaps.h5,
                    const Text("8 to 20 characters"),
                  ],
                ),
                Gaps.v5,
                Row(
                  children: [
                    TweenAnimationBuilder(
                      tween: ColorTween(
                        begin: Colors.grey.shade700,
                        end: regColor,
                      ),
                      duration: const Duration(
                        milliseconds: 100,
                      ),
                      builder: (context, color, child) => FaIcon(
                        FontAwesomeIcons.circleCheck,
                        size: Sizes.size20,
                        color: color,
                      ),
                    ),
                    Gaps.h5,
                    const Text("Letters, numbers, and special characters"),
                  ],
                ),
              ],
            ),
            Gaps.v40,
            GestureDetector(
              onTap: _onNextTap,
              child: FormButton(
                text: "Next",
                disabled: _password.isEmpty || !regExp.hasMatch(_password),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
