import 'dart:convert';

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:madee_kan/Models/anak_kontrakan_model.dart';
import 'package:madee_kan/Models/pembayaran_model.dart';

class PembayaranService {
  String baseURL = 'https://madeekan.madee.my.id/api';

  Future<List<PembayaranModel>> getAnakKontrakan({
    required String token,
  }) async {
    try {
      var url = '$baseURL/get-pembayaran';
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
        List<PembayaranModel> pembayaran = [];
        for (var item in data) {
          pembayaran.add(PembayaranModel.fromJson(item));
        }
        return pembayaran;
      } else {
        throw Exception('Failed to get anak kontrakan');
      }
    } catch (e) {
      throw e;
    }
  }
}
