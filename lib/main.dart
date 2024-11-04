import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/routes/app_pages.dart';
import 'package:learn_getx/routes/app_routes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // runApp(MyApp());
  runApp(GetMaterialApp(
    initialRoute: AppRoutes.login,
    getPages: AppPages.pages,
    debugShowCheckedModeBanner: false,
  ));
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       initialRoute: AppRoutes.login,
//       getPages: AppPages.pages,

//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
