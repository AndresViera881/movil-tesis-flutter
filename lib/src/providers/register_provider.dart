import 'package:flutter_udemy_delivery/src/pages/login/login_controller.dart';
import 'package:get/get.dart';
import '../environment/environment.dart';
import '../models/register_model.dart';

class RegisterProvider extends GetConnect {
  String url = Environment.API_URL + '/api/registro';
  LoginController _loginController = Get.put(LoginController());

  Future<Response> register(RegistroCliente registroCliente) async {
    Response response = await post('$url', registroCliente.toJson(),
        headers: {'Content-Type': 'application/json'});
    _loginController.goToLoginPage();
    return response;
  }
}
