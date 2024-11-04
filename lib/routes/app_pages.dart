import 'package:get/get.dart';
import 'package:learn_getx/bindings/auth_binding.dart';
import 'package:learn_getx/ui/counter_view.dart';
import 'package:learn_getx/ui/login.dart';
import 'package:learn_getx/ui/register.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.register,
      page: () => Register(),
    ),
    GetPage(name: AppRoutes.login, page: () => Login()),
    GetPage(name: AppRoutes.home, page: () => CounterView()),
  ];
}
