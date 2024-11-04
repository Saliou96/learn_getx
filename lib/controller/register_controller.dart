import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:learn_getx/ui/login.dart';

class RegisterController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
  }

  void register(String email, String password) async {
    try {
      Map<String, dynamic> userData = {'email': email};

      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await firestore.collection('users').add(userData).then((docRef) {
        print("User added with ID: ${docRef.id}");
      }).catchError((error) {
        print("Error adding user: $error");
      });

      sendEmailVerification();
      Get.offAll(Login());
    } catch (e) {
      Get.snackbar("Registration Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void sendEmailVerification() async {
    try {
      await auth.currentUser?.sendEmailVerification();
      Get.snackbar("Notification", "Lien d'activation envoyé",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Registration Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
