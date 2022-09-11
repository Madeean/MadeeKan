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

  Future<List<AnakKontrakan>> getAnakKontrakan({
    required String token,
  }) async {
    try {
      var url = '$baseURL/get-anak-kontrakan';
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        List<AnakKontrakan> anakKontrakan = [];
        for (var item in data) {
          anakKontrakan.add(AnakKontrakan.fromJson(item));
        }
        return anakKontrakan;
      } else {
        throw Exception('Failed to get anak kontrakan');
      }
    } catch (e) {
      throw e;
    }
  }

  Future<List<String>> getNamaAnakKontrakan({required String token}) async {
    try {
      var url = '$baseURL/get-anak-kontrakan';
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        final stores = data.length;
        print("data :${data[1]['name']}");
        List<String> namaAnakKontrakan = [];
        for (int i = 0; i < stores; i++) {
          namaAnakKontrakan.add(data[i]['name']);
        }
        return namaAnakKontrakan;
      } else {
        throw Exception('Failed to get anak kontrakan');
      }
    } catch (e) {
      throw e;
    }
  }
}
