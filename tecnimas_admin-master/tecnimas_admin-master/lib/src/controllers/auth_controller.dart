import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screen/home_screen.dart';
import '../screen/login_screen.dart';

class AuthController extends GetxController {
  var displayName = '';

  FirebaseAuth auth = FirebaseAuth.instance;

  var rememberPass = false;

  User? get userProfile => auth.currentUser;

  void signUp(String name, String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayName = name;
        auth.currentUser!.updateDisplayName(name);

        // Agregar el campo "admin" con valor false al documento de usuario
        FirebaseFirestore.instance
            .collection('usuarios')
            .doc(value.user!.uid)
            .set({
          'nombre': name,
          'correo': email,
          'admin': false,
        });
      });

      update();
      Get.offAll(() => Home());
    } on FirebaseAuthException catch (e) {
      // Manejo de excepciones de autenticación
      String title = e.code.replaceAll(RegExp('-'), ' '.capitalize!);
      String message = '';

      if (e.code == 'weak-password') {
        message = "The password provided is too weak";
      } else if (e.code == "email-already-in-use") {
        message = "The email already exists for that email";
      } else {
        message = e.message.toString();
      }

      Get.snackbar("Error occurred!", message,
          backgroundColor: Colors.red, colorText: Colors.white);
    } catch (e) {
      Get.snackbar("Error occurred!", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void changeCheck(value) {
    rememberPass = value;
  }

  void signIn(String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => displayName = userProfile!.displayName!);

      auth.currentUser!.updateDisplayName(displayName);

      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (rememberPass) {
        await prefs.setString('email', email);
        await prefs.setString('pass', password);
      } else {
        await prefs.remove('email');
        await prefs.remove('pass');
      }

      Get.offAll(() => const Home());
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
