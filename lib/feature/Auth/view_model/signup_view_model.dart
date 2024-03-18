import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/feature/Auth/repos/authentication_repo.dart';

class SignupViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }
}

final signupProvider = StateProvider((ref) => {});
