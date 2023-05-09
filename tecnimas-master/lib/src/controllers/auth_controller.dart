import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecnimas/src/screen/home_screen.dart';
import 'package:tecnimas/src/screen/login_screen.dart';

class AuthController extends GetxController {
  var displayName = '';

  FirebaseAuth auth = FirebaseAuth.instance;

  User? get userProfile => auth.currentUser;

  void signUp(String name, String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayName = name;
        auth.currentUser!.updateDisplayName(name);
      });
      update();
      Get.offAll(() => Home());
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' '.capitalize!);
      String message = '';

      if (e.code == 'weak-password') {
        message = "The password provided is too weak";
      } else if (e.code == "email-already-in-use") {
        message = "The email already exist for that email";
      } else {
        message = e.message.toString();
      }
    } catch (e) {
      Get.snackbar("Error ocurred!", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void signIn(String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => displayName = userProfile!.displayName!);

      auth.currentUser!.updateDisplayName(displayName);
      Get.offAll(() => Home());
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;

      String message = '';

      if (e.code == 'wrong-password') {
        message = 'Invalid Password. Please try again!';
      } else if (e.code == 'user-not-found') {
        message =
            ('The account does not exists for $email. Create your account by signing up.');
      } else {
        message = e.message.toString();
      }

      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } catch (e) {
      Get.snackbar(
        'Error occured!',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void signOut() async {
    try {
      await auth.signOut();
      displayName = '';
      update();
      Get.offAll(() => Login());
    } catch (e) {
      Get.snackbar('Error ocurred!', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
