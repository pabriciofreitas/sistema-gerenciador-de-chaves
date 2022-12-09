import 'package:chave/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignUpController extends GetxController {
  final GetStorage box = GetStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? firebaseUser;
  bool isloading = false;

  bool passObscure = true;

  Future<void> signUp({
    required UserModel userModel,
    required String pass,
  }) async {
    await _auth
        .createUserWithEmailAndPassword(email: userModel.email, password: pass)
        .then((value) async {
      firebaseUser = value.user;
    });

    await _saveUserData(userModel);
  }

  Future<void> _saveUserData(UserModel userModel) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(firebaseUser!.uid)
          .set(userModel.toMap());
    } catch (e) {
      Get.snackbar(
        'Erro',
        e.toString(),
        colorText: Colors.white,
        duration: const Duration(seconds: 30),
        backgroundColor: const Color(0xff251230),
      );
    }

    print(userModel.toMap());
  }

  // @override
  // onInit() {

  //   super.onInit();
  // }

  // @override
  // Future<void> onClose() async {
  //   // await updateListSenders();
  //   super.onClose();
  // }
}
