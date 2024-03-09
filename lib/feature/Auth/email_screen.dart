import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:project/constants/gaps.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/feature/Auth/constants/form_button.dart';
import 'package:project/feature/Auth/password_screen.dart';

class EmailScreen extends ConsumerStatefulWidget {
  const EmailScreen({
    super.key,
    required this.username,
  });

  final String username;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EmailScreenState();
}

class _EmailScreenState extends ConsumerState<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();

  String _email = '';
  final regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      _email = _emailController.text;
      setState(() {});
    });
  }

  void _onNextTap() {
    if (_email.isEmpty || !regExp.hasMatch(_email)) return;
    context.push(
      PasswordScreen.routeURL,
    );
  }

  void _onSkipTap() {
    context.pop();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.only(
              left: Sizes.size10,
            ),
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: _onSkipTap,
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
              "Create Email! ${widget.username}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Gaps.v10,
            const Text(
              "Don't forget it",
              style: TextStyle(
                color: Colors.black38,
              ),
            ),
            Gaps.v40,
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(
                  color: Colors.black45,
                ),
              ),
            ),
            Gaps.v40,
            GestureDetector(
              onTap: _onNextTap,
              child: FormButton(
                disabled: _email.isEmpty || !regExp.hasMatch(_email),
                text: "Next",
              ),
            )
          ],
        ),
      ),
    );
  }
}
