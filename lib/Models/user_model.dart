import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends Equatable {
  final int id;
  final String name;
  final String email;
  final String yourKontrakanName;
  final int howManyRooms;
  final String token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.yourKontrakanName,
    required this.howManyRooms,
    required this.token,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      ['id', 'name', 'email', 'yourKontrakanName', "howManyRooms", 'token'];
}
