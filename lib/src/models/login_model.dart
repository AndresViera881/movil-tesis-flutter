// To parse this JSON data, do
//
//     final loginCliente = loginClienteFromJson(jsonString);

import 'dart:convert';

LoginCliente loginClienteFromJson(String str) =>
    LoginCliente.fromJson(json.decode(str));

String loginClienteToJson(LoginCliente data) => json.encode(data.toJson());

class LoginCliente {
  String? correo;
  String? password;

  LoginCliente({
    required this.correo,
    required this.password,
  });

  factory LoginCliente.fromJson(Map<String, dynamic> json) => LoginCliente(
        correo: json["correo"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "correo": correo,
        "password": password,
      };
}
