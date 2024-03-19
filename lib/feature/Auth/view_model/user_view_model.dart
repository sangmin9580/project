import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/feature/Auth/users/model/user_model.dart';
import 'package:project/feature/Auth/users/repos/user_repo.dart';

class UserProfileViewModel extends AsyncNotifier<UserProfileModel> {
  late final UserReository _repository;

  @override
  FutureOr<UserProfileModel> build() {
    _repository = ref.read(userRepoProvider);
    return UserProfileModel.empty();

    //로그인 된 상태에서 usermodel불러오기
    // 로그인 전 userprofile불러오기
  }

  Future<void> createProfile(UserCredential credential) async {
    if (credential.user == null) {
      throw Exception("Account not created");
    }
    state = const AsyncValue.loading();
    final profile = UserProfileModel(
      bio: "undefined",
      link: "undefined",
      email: credential.user!.email ?? "anon@anon.com",
      uid: credential.user!.uid,
      name: credential.user!.displayName ?? "Anon",
    );
    await _repository.createProfile(profile);
    state = AsyncValue.data(profile);
  }
}

final UserProfileProvider =
    AsyncNotifierProvider<UserProfileViewModel, UserProfileModel>(
  () => UserProfileViewModel(),
);
