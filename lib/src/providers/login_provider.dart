import 'package:flutter_udemy_delivery/src/environment/environment.dart';
import 'package:flutter_udemy_delivery/src/models/login_model.dart';
import 'package:flutter_udemy_delivery/src/pages/login/login_controller.dart';
import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  String url = Environment.API_URL + '/api/login-cliente';
  LoginController _loginController = Get.put(LoginController());

  Future<Response> login(LoginCliente loginCliente) async {
    Response response = await post('$url', loginCliente.toJson(),
        headers: {'Content-Type': 'application/json'});
    //_loginController.goToCitasPage();
    print('si se puede ir a otra pantalla');
    return response;
  }
}
