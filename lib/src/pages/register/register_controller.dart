import 'package:flutter/cupertino.dart';
import 'package:flutter_udemy_delivery/src/models/register_model.dart';
import 'package:flutter_udemy_delivery/src/providers/register_provider.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController cedulaController = TextEditingController();
  TextEditingController nombresController = TextEditingController();
  TextEditingController apellidosController = TextEditingController();
  TextEditingController fechaNacimientoController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  TextEditingController sexoController = TextEditingController();
  TextEditingController correoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RegisterProvider registerProvider = RegisterProvider();

  void goToRegisterPage() {
    Get.toNamed('/login');
  }

  void register() async {
    String cedula = cedulaController.text.trim();
    String nombres = nombresController.text.trim();
    String apellidos = apellidosController.text.trim();
    String fecha_nacimiento = fechaNacimientoController.text.trim();
    String telefono = telefonoController.text.trim();
    String direccion = direccionController.text.trim();
    String sexo = sexoController.text.trim();
    String correo = correoController.text.trim();
    String password = passwordController.text.trim();

    // Get.snackbar('Cedula', cedula);
    // Get.snackbar('Nombres', nombres);
    // Get.snackbar('Apellidos', apellidos);
    // Get.snackbar('fechaNacimiento', fecha_nacimiento);
    // Get.snackbar('Telefono', telefono);
    // Get.snackbar('Direccion', direccion);
    // Get.snackbar('Sexo', sexo);
    // Get.snackbar('correo', correo);
    // Get.snackbar('Password', password);

    if (isValidForm(cedula, nombres, apellidos, fecha_nacimiento, telefono,
        direccion, sexo, correo, password)) {
      RegistroCliente registroCliente = RegistroCliente(
          cedula: cedula,
          nombres: nombres,
          apellidos: apellidos,
          fecha_nacimiento: fecha_nacimiento,
          telefono: telefono,
          direccion: direccion,
          sexo: sexo,
          correo: correo,
          password: password);

      Response response = await registerProvider.register(registroCliente);
      print('Response: ${response.body}');

      Get.snackbar('Formulario valido', 'Correcto!!!');
    }
  }

  bool isValidForm(
      String cedula,
      String nombres,
      String apellidos,
      String fecha_nacimiento,
      String telefono,
      String direccion,
      String sexo,
      String correo,
      String password) {
    if (cedula.isEmpty &&
        nombres.isEmpty &&
        apellidos.isEmpty &&
        fecha_nacimiento.isEmpty &&
        telefono.isEmpty &&
        direccion.isEmpty &&
        sexo.isEmpty &&
        correo.isEmpty &&
        password.isEmpty) {
      Get.snackbar('Formulario no valido', 'Todos los campos son requeridos');
      return false;
    }

    if (cedula.isEmpty) {
      Get.snackbar('Formulario no valido', 'La cédula es requerida');
      return false;
    }

    if (nombres.isEmpty) {
      Get.snackbar('Formulario no valido', 'Los nombres son requeridos');
      return false;
    }

    if (apellidos.isEmpty) {
      Get.snackbar('Formulario no valido', 'Los apellidos son requeridos');
      return false;
    }

    if (telefono.isEmpty) {
      Get.snackbar('Formulario no valido', 'El teléfono es requerido');
      return false;
    }

    if (direccion.isEmpty) {
      Get.snackbar('Formulario no valido', 'La dirección es requerida');
      return false;
    }

    if (correo.isEmpty) {
      Get.snackbar('Formulario no valido', 'El correo es requerido');
      return false;
    }

    if (!GetUtils.isEmail(correo)) {
      Get.snackbar('Formulario no valido', 'El correo no es valido');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'El password es requerido');
      return false;
    }

    return true;
  }
}
