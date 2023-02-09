import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  void goToLoginPage() {
    Get.toNamed('/login');
  }

  void goToCitasPage() {
    Get.toNamed('/cita');
  }

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    print(email);
    print(password);
    Get.snackbar('Email', email);
    Get.snackbar('Password', password);
    if (isValidForm(email, password)) {
      Get.snackbar('Formulario valido', 'Correcto!!!');
    }
  }

  bool isValidForm(String email, String password) {
    if (email.isEmpty && password.isEmpty) {
      Get.snackbar(
          'Formulario no valido', 'El email y el password son requeridos');
      return false;
    }

    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'El email es requerido');
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'El password es requerido');
      return false;
    }

    return true;
  }
}
