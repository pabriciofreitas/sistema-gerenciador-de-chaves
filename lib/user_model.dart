import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: constant_identifier_names
enum Power {USER,VALIDATOR,ADM}

class UserModel {


  String phone;
  String cpf;
  String email;
  bool validator;
  Power? power;
  String name;

 
  UserModel({
    required this.phone,
    required this.cpf,
    required this.email,
    required this.validator,
    this.power,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'validator': validator,
      'power': power!=null? power!.index :null,
      'name': name,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(

      cpf: map['cpf'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      validator: map['validator'] ?? false,
      power: map['power'] != null ? Power.values[map['power']??0] : null,
      name: map['name'] ?? '',
    );
  }



  @override
  String toString() {
    return 'UserModel(email: $email, validator: $validator, power: $power, name: $name)';
  }


}
