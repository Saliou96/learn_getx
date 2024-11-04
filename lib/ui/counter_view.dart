import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/controller/counter_controller.dart';
import 'package:learn_getx/controller/login_controller.dart';
import 'dart:ui';

class CounterView extends StatelessWidget {
  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final CounterController c = Get.put(CounterController());
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(
        title: Text("Counter"),
        actions: [
          IconButton(
              onPressed: () => {Get.changeTheme(ThemeData.light())},
              icon: Icon(Icons.wb_sunny_outlined)),
          IconButton(
              onPressed: () => {Get.changeTheme(ThemeData.dark())},
              icon: Icon(Icons.wb_sunny)),
          IconButton(
              onPressed: () => {controller.logout()},
              icon: Icon(Icons.exit_to_app)),
        ],
      ),
      // body: Center(
      //     child: Obx(() => Text(
      //           "Clicks: ${c.count}",
      //           style: TextStyle(fontSize: 25),
      //         ))),

      body: Obx(() {
        // Affiche le spinner au centre de la page si isLoggingOut est true
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        // Sinon, affiche le compteur normalement
        return Center(
          child: Text(
            "Clicks: ${c.count}",
            style: TextStyle(fontSize: 25),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: c.increment,
      ),
    );
    floatingActionButton:
    FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment);
  }
}
