import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/ui/counter_view.dart';
import 'package:learn_getx/ui/login.dart';

class LoginController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void login(String email, String password) async {
    try {
      isLoading.value = true;

      // Authentification de l'utilisateur
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Récupération de l'utilisateur actuel
      User? user = auth.currentUser;

      if (user != null && !user.emailVerified) {
        // Si l'utilisateur n'a pas vérifié son email
        Get.snackbar(
            "Email not verified", "Please verify your email before logging in.",
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 2));

        // Optionnel : Envoyer un lien de vérification à nouveau
        await user.sendEmailVerification();
        return;
      }

      // Si l'email est vérifié, redirige l'utilisateur vers CounterView
      Get.snackbar("Notification", "Login successful",
          duration: Duration(seconds: 2), snackPosition: SnackPosition.BOTTOM);
      Get.offAll(CounterView());
    } catch (e) {
      print("error $e");
      Get.snackbar("Login Error", e.toString(),
          duration: Duration(seconds: 2), snackPosition: SnackPosition.BOTTOM);
    } finally {
      // Définir isLoading sur false après la tentative de connexion
      isLoading.value = false;
    }
  }

  void logout() async {
    isLoading.value = true;
    await auth.signOut();
    sleep(Duration(seconds: 2));
    isLoading.value = false;
    Get.offAll(Login());
  }
}
