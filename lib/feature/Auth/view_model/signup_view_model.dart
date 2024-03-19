import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/feature/Auth/repos/authentication_repo.dart';
import 'package:project/feature/Auth/users/repos/user_repo.dart';
import 'package:project/feature/Auth/view_model/user_view_model.dart';

class SignupViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signupForm);
    state = await AsyncValue.guard(
      () async {
        final userCredential = await _authRepo.signUp(
          form['email'],
          form['password'],
        );
        final userRepo = ref.read(UserProfileProvider.notifier);
        await userRepo.createProfile(userCredential);
      },
    );
  }
}

final signupForm = StateProvider((ref) => {});
final signupProvider = AsyncNotifierProvider<SignupViewModel, void>(
  () => SignupViewModel(),
);
