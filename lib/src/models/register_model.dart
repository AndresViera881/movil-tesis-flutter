// To parse this JSON data, do
//
//     final registroCliente = registroClienteFromJson(jsonString);

import 'dart:convert';

RegistroCliente registroClienteFromJson(String str) =>
    RegistroCliente.fromJson(json.decode(str));

String registroClienteToJson(RegistroCliente data) =>
    json.encode(data.toJson());

class RegistroCliente {
  String? cedula;
  String? nombres;
  String? apellidos;
  String? fecha_nacimiento;
  String? direccion;
  String? telefono;
  String? sexo;
  String? correo;
  String? password;

  RegistroCliente({
    required this.cedula,
    required this.nombres,
    required this.apellidos,
    required this.fecha_nacimiento,
    required this.direccion,
    required this.telefono,
    required this.sexo,
    required this.correo,
    required this.password,
  });

  factory RegistroCliente.fromJson(Map<String, dynamic> json) =>
      RegistroCliente(
        cedula: json["cedula"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        fecha_nacimiento: json["fecha_nacimiento"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        sexo: json["sexo"],
        correo: json["correo"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "cedula": cedula,
        "nombres": nombres,
        "apellidos": apellidos,
        "fecha_nacimiento": fecha_nacimiento,
        "direccion": direccion,
        "telefono": telefono,
        "sexo": sexo,
        "correo": correo,
        "password": password,
      };
}
