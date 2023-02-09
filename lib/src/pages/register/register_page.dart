import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_udemy_delivery/src/pages/login/login_controller.dart';
import 'package:flutter_udemy_delivery/src/pages/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterController _registerController = Get.put(RegisterController());
  LoginController _loginController = Get.put(LoginController());
  DateTime selectedDate = DateTime.now();

  final _items = ['Masculino', 'Femenino'];
  String _selected = '--Seleccione--';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //Posicionar elementos uno encima del otro
        children: [
          _backgroundCover(context),
          _boxForm(context),
          Column(
            //Posicionar elementos uno debajo del otro
            children: [_imageCover(), _textAddName()],
          )
        ],
      ),
    );
  }

  //Metodo privado y flutter reconoce como privado el guion bajo _
  Widget _imageCover() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 50, bottom: 15),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/img/isotiopo.png',
          width: 80,
          height: 80,
        ),
      ),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.42,
      color: Colors.green,
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.80,
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.10,
            left: 50,
            right: 50),
        decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15,
            offset: Offset(0, 0.75),
          )
        ]),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _textYourInfo(),
              _textFieldCedula(),
              _textFieldNombres(),
              _textFieldApellidos(),
              _textFieldFecha(),
              _textFieldDireccion(),
              _textFieldTelefono(),
              _selectedFieldGenero(),
              _textFieldEmail(),
              _textFieldPassword(),
              _buttonRegister(),
              _buttonLogin(),
            ],
          ),
        ));
  }

  Widget _textAddName() {
    return Text(
      'Registrate Aqui!',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _buttonRegister() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: ElevatedButton(
        onPressed: () => _registerController.register(),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15)),
        child: Text(
          'REGISTRAR',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
      child: ElevatedButton(
        onPressed: () => _loginController.goToLoginPage(),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15)),
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _textYourInfo() {
    return Container(
      margin: EdgeInsets.only(top: 80, bottom: 50),
      child: Text(
        'REGISTRA TUS CREDENCIALES',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _textFieldCedula() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: _registerController.cedulaController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Cédula',
          prefixIcon: Icon(Icons.person),
        ),
      ),
    );
  }

  Widget _textFieldNombres() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: _registerController.nombresController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: 'Nombres',
          prefixIcon: Icon(Icons.person),
        ),
      ),
    );
  }

  Widget _textFieldApellidos() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: _registerController.apellidosController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Apellidos',
          prefixIcon: Icon(Icons.person),
        ),
      ),
    );
  }

  Widget _textFieldFecha() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: _registerController.fechaNacimientoController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'dd/mm/aaaa',
          prefixIcon: Icon(Icons.date_range),
        ),
      ),
    );
  }

  Widget _textFieldDireccion() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: _registerController.direccionController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Dirección',
          prefixIcon: Icon(Icons.place),
        ),
      ),
    );
  }

  Widget _textFieldTelefono() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: _registerController.telefonoController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Teléfono',
          prefixIcon: Icon(Icons.phone),
        ),
      ),
    );
  }

  Widget _selectedFieldGenero() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: _registerController.sexoController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Genero',
          prefixIcon: Icon(Icons.person_add_alt),
        ),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: _registerController.correoController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Correo electrónico',
          prefixIcon: Icon(Icons.email),
        ),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: _registerController.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          prefixIcon: Icon(Icons.lock),
        ),
      ),
    );
  }
}
