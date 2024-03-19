import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/feature/Auth/users/model/user_model.dart';

class UserReository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

// user 프로필 생성

  Future<void> createProfile(UserProfileModel profile) async {
    _db.collection("users").doc(profile.uid).set(profile.toJson());
  }

// user 프로필 불러오기
//user 프로필 수정
}

final userRepoProvider = Provider((ref) => UserReository());
