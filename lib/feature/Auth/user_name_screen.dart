import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:project/constants/gaps.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/feature/Auth/constants/form_button.dart';
import 'package:project/feature/Auth/email_screen.dart';

class UsernameScreen extends ConsumerStatefulWidget {
  const UsernameScreen({super.key});

  static const routeURL = '/username';
  static const routeName = 'username';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends ConsumerState<UsernameScreen> {
  void _onSkipTap() {
    context.pop();
  }

  final TextEditingController _usernameController = TextEditingController();

  String _username = '';

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      _username = _usernameController.text;
      setState(() {});
    });
  }

  void _onNextTap() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EmailScreen(username: _username),
        ));
  }

  @override
  void dispose() {
    _usernameController.dispose();
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
              "Create Username",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Gaps.v10,
            const Text(
              "You can always change this later.",
              style: TextStyle(
                color: Colors.black38,
              ),
            ),
            Gaps.v40,
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: "Username",
                hintStyle: TextStyle(
                  color: Colors.black45,
                ),
              ),
            ),
            Gaps.v40,
            GestureDetector(
              onTap: _onNextTap,
              child: FormButton(
                text: "Sign up",
                disabled: _username.isEmpty,
              ),
            )
          ],
        ),
      ),
    );
  }
}
