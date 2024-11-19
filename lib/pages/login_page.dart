import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_project/widget/my_text.dart';
import 'package:pas_project/widget/my_textfield.dart';
import '../controller/LoginController.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            Center(
              child: MyText(
                hintText: "Welcome Back",
                fontSize: 28,
                fontWeight: FontWeight.bold,
                colors: const Color.fromARGB(255, 255, 255, 255),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: MyText(
                hintText: "Enter your credential to login",
                fontSize: 16,
                colors: Colors.grey,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            MyTextField(
              hintText: 'Username',
              controller: usernameController,
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 16),
            MyTextField(
              hintText: 'Password',
              isPassword: true,
              controller: passwordController,
              icon: Icons.lock_outline,
            ),
            const SizedBox(height: 20),
            Obx(() => ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 236, 197, 27),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  onPressed: controller.isLoading.value
                      ? null
                      : () async {
                          if (usernameController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: MyText(
                                  hintText: "Nama dan password harus diisi!",
                                  fontSize: 16,
                                  colors: Colors.white,
                                ),
                                backgroundColor: Colors.redAccent,
                              ),
                            );
                          } else {
                            await controller.login(
                                usernameController.text,
                                passwordController.text);
                            if (controller.loginStatus.value ==
                                "Login success") {
                              Get.toNamed('/dashboard');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: MyText(
                                    hintText: controller.loginStatus.value,
                                    fontSize: 16,
                                    colors: Colors.white,
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          }
                        },
                  child : controller.isLoading.value
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : MyText(
                          hintText: "Login",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          colors: Colors.white,
                        ),
                )),
            const SizedBox(height: 16),
            Center(
              child: MyText(
                hintText: "Forgot password?",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                colors: const Color.fromARGB(255, 236, 197, 27),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  hintText: "Don't have an account?",
                  fontSize: 16,
                  colors: const Color.fromARGB(255, 255, 255, 255),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    // Tambahkan navigasi ke halaman signup
                  },
                  child: MyText(
                    hintText: "Sign Up",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    colors: const Color.fromARGB(255, 236, 197, 27),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

