import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:learn_getx/ui/login.dart';

class RegisterController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void register(String email, String password) async {
    isLoading.value = true;
    try {
      Map<String, dynamic> userData = {'email': email};

      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await firestore.collection('users').add(userData).then((docRef) {
        print("User added with ID: ${docRef.id}");
      }).catchError((error) {
        print("Error adding user: $error");
      });

      sendEmailVerification(email);
      Get.offAll(Login());
    } catch (e) {
      Get.snackbar("Registration Error", e.toString(),
          duration: Duration(seconds: 2), snackPosition: SnackPosition.BOTTOM);
    } finally {
      // Définir isLoading sur false après la tentative de connexion
      isLoading.value = false;
    }
  }

  void sendEmailVerification(String email) async {
    try {
      await auth.currentUser?.sendEmailVerification();
      Get.snackbar("Notification",
          "Un lien d'activation a été envoyé à $email. Veuillez cliquer dessus pour activer votre compte.",
          duration: Duration(seconds: 5), snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Registration Error", e.toString(),
          duration: Duration(seconds: 2), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
