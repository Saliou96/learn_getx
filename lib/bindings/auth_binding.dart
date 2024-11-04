import 'package:get/get.dart';
import 'package:learn_getx/controller/login_controller.dart';
import 'package:learn_getx/controller/register_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(RegisterController());
  }
}
