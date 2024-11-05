import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/controller/login_controller.dart';
import 'package:learn_getx/controller/register_controller.dart';
import 'package:learn_getx/ui/login.dart';

class Register extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final RegisterController controller = Get.put(RegisterController());

  // Register({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: constraints.maxHeight * 0.08),
                Image.network(
                  "https://i.postimg.cc/nz0YBQcH/Logo-light.png",
                  height: 100,
                ),
                SizedBox(height: constraints.maxHeight * 0.08),
                Text(
                  "INSCRIPTION",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          filled: true,
                          fillColor: Color(0xFFF5FCF9),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0 * 1.5, vertical: 16.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                        onSaved: (name) {
                          // Save it
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          hintText: 'Mot de passe',
                          filled: true,
                          fillColor: Color(0xFFF5FCF9),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0 * 1.5, vertical: 16.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16.0),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     if (_formKey.currentState!.validate()) {
                      //       _formKey.currentState!.save();
                      //       controller.register(
                      //           emailController.text, passwordController.text);
                      //     }
                      //   },
                      //   style: ElevatedButton.styleFrom(
                      //     elevation: 0,
                      //     backgroundColor: const Color(0xFF00BF6D),
                      //     foregroundColor: Colors.white,
                      //     minimumSize: const Size(double.infinity, 48),
                      //     shape: const StadiumBorder(),
                      //   ),
                      //   child: const Text("S'inscrire"),
                      // ),

                      Obx(() {
                        return controller.isLoading.value
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    controller.register(emailController.text,
                                        passwordController.text);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: const Color(0xFF00BF6D),
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(double.infinity, 48),
                                  shape: const StadiumBorder(),
                                ),
                                child: const Text("S'inscrire"),
                              );
                      }),
                      TextButton(
                        onPressed: () {
                          Get.to(Login());
                        },
                        child: Text.rich(
                          const TextSpan(
                            text: "Déjà membre? ",
                            children: [
                              TextSpan(
                                text: "Se connecter",
                                style: TextStyle(color: Color(0xFF00BF6D)),
                              ),
                            ],
                          ),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color!
                                        .withOpacity(0.64),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
