import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_zone/core/api/api_constants.dart';

import '../../features/auth/data/models/user_model.dart';
import '../../features/auth/domain/entities/user_entity.dart';
import '../utils/secure_storage.dart';
import '../utils/storage_keys.dart';

class FirebaseApi {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final SecureStorage secureStorage;

  FirebaseApi(this.secureStorage);

  signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    final credential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    final id = credential.user?.uid;

    await fireStore.collection(ApiConstants.cUsers).doc(id).set(
          UserModel.fromEntity(UserEntity.empty(
            id: id ?? "",
            name: name,
          )).toJson(),
        );

    await secureStorage.save(key: StorageKeys.kId, value: id);
  }

  signIn({required String email, required String password}) async {
    final credential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    final id = credential.user?.uid;

    await secureStorage.save(key: StorageKeys.kId, value: id);
  }

  Future<UserModel> getCurrentUser() async {
    final userId = await secureStorage.get(key: StorageKeys.kId);

    final json =
        await fireStore.collection(ApiConstants.cUsers).doc(userId).get();

    log((json.data()!).toString());
    final model = UserModel.fromJson(json.data()!);

    return model;
  }

  // final FirebaseAuth auth = FirebaseAuth.instance;
  // final FirebaseFirestore core = FirebaseFirestore.instance;

  // signUp ({required String email,required String password,}) async {
  //   final UserCredential credentials = await auth.createUserWithEmailAndPassword(email: email, password: password,);
  //   log("User sign up $credentials");
  // }

  // signIn ({required String email,required String password,}) async {
  //   final UserCredential credentials = await auth.signInWithEmailAndPassword(email: email, password: password,);
  //   log("User sign in $credentials");
  // }
}
