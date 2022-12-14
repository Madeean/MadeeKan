import 'dart:convert';

import 'package:madee_kan/Models/user_model.dart';

import 'package:http/http.dart' as http;

class AuthService {
  String baseURL = 'https://madeekan.madee.my.id/api';

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    required String kontrakanName,
    required int howManyRooms,
  }) async {
    try {
      print("sampai");
      var url = '$baseURL/register';
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };
      var body = {
        'name': "$name",
        'email': "$email",
        'password': "$password",
        'nama_kontrakan': "$kontrakanName",
        'rooms': "$howManyRooms",
      };
      print("3");

      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['user'];
        data['token'] = jsonDecode(response.body)['token'];

        UserModel user = UserModel(
            id: data['id'],
            name: data['name'],
            email: data['email'],
            yourKontrakanName: data['nama_kontrakan'],
            howManyRooms: data['rooms'],
            token: data['token']);
        print("chekpoint");
        return user;
      } else {
        throw Exception('Failed to register');
      }
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      print("sampai");
      var url = '$baseURL/login';
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };
      var body = {
        'email': "$email",
        'password': "$password",
      };
      print("3");

      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['user'];
        data['token'] = jsonDecode(response.body)['token'];

        UserModel user = UserModel(
            id: data['id'],
            name: data['name'],
            email: data['email'],
            yourKontrakanName: data['nama_kontrakan'],
            howManyRooms: data['rooms'],
            token: data['token']);
        print("chekpoint");
        return user;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> logout({
    required String token,
  }) async {
    var url = '$baseURL/logout';
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to logout');
    }
  }
}
