import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/PushData.dart';

import '../auth/login.dart';

class AuthController extends GetxController {
  //AuthController.instance;
  static AuthController instance = Get.find();
  //email, password, name...
  // ignore: unused_field
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //our user would be notified.
    _user.bindStream(auth.userChanges());

    ever(_user, _initialScreen);
  }

  // ignore: unused_element
  _initialScreen(User? user) {
    if (user == null) {
      print("login page");
      Get.offAll(() => const Login());
    } else {
      Get.offAll(() => PushData(emailAdmin: user.email!,));
    }
  }

  //Home(email: user.email));//

  //sing Up function,
  Future<void> register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About User",
        "User message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.TOP,
        titleText: const Text(
          "Account creation failed",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(e.toString()),
      );
    }
  }

  //LogIn function.
  Future<void> login(String email, String password) async {
    try {
      print('login');
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.TOP,
        titleText: const Text(
          "Login failed",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(e.toString()),
      );
    }
  }

  //logOut function.
  Future<void> logOut() async {
    await auth.signOut();
  }
}
