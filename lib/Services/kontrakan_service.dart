import 'dart:convert';

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:madee_kan/Models/anak_kontrakan_model.dart';

class KontrakanService {
  String baseURL = 'https://madeekan.madee.my.id/api';

  Future<void> addAnakKontrakan({
    required String name,
    required int umur,
    required String alamat_asli,
    required String alamat_kontrakan,
    required int harga_perbulan,
    required String foto_muka,
    required String token,
  }) async {
    try {
      print("sampai");
      var url = '$baseURL/add-anak-kontrakan';
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      // var body = {
      //   'name': name,
      //   'umur': umur,
      //   'alamat_asli': alamat_asli,
      //   'alamat_kontrakan': alamat_kontrakan,
      //   'harga_perbulan': harga_perbulan,
      //   'foto_muka': foto_muka,
      // };
      print("3");

      var request = http.MultipartRequest('POST', Uri.parse(url))
        ..fields['umur'] = umur.toString()
        ..fields['name'] = name
        ..fields['alamat_asli'] = alamat_asli
        ..fields['alamat_kontrakan'] = alamat_kontrakan
        ..fields['harga_perbulan'] = harga_perbulan.toString()
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath('foto_muka', foto_muka));

      var streamedResponse = await request.send();
      var response = http.Response.fromStream(streamedResponse);

      // var response = await http.post(
      //   Uri.parse(url),
      //   headers: headers,
      //   body: jsonEncode(body),
      // );
    } catch (e) {
      throw e;
    }
  }
}
