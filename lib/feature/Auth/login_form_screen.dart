import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project/constants/gaps.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/feature/Auth/constants/form_button.dart';
import 'package:project/feature/Auth/view_model/login_view_model.dart';

class LoginformScreen extends ConsumerStatefulWidget {
  const LoginformScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LoginformScreenState();
}

class _LoginformScreenState extends ConsumerState<LoginformScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  void _onNextTap() {
    if (_formKey.currentState != null) {
      _formKey.currentState!.validate();
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        ref
            .read(loginProvider.notifier)
            .logIn(_form['email'], _form['password'], context);

        // context.go("/home");
      }
    }
  }

  final Map<String, dynamic> _form = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size20,
          vertical: Sizes.size40,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: Sizes.size60,
                child: TextFormField(
                  validator: (value) {
                    return null;
                  },
                  onSaved: (newValue) {
                    _form["email"] = newValue;
                  },
                  decoration: const InputDecoration(
                    hintText: "Email",
                  ),
                ),
              ),
              Gaps.v20,
              SizedBox(
                height: Sizes.size60,
                child: TextFormField(
                  validator: (value) => null,
                  onSaved: (newValue) {
                    _form['password'] = newValue;
                  },
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                ),
              ),
              Gaps.v20,
              GestureDetector(
                  onTap: _onNextTap,
                  child: FormButton(
                      disabled: ref.read(loginProvider).isLoading,
                      text: "Next"))
            ],
          ),
        ),
      ),
    );
  }
}
