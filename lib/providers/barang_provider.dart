import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inventory_management/models/barang_model.dart';
import 'package:http/http.dart' as http;

class BarangProvider with ChangeNotifier {
  late BarangModel _barang;

  BarangModel get barang => _barang;

  set barang(BarangModel newBarang) {
    _barang = newBarang;
    notifyListeners();
  }

  Future<BarangModel?> postBarang(
      String nama, String lokasi, String jumlah, String deskripsi) async {
    try {
      var body = {
        'nama': nama,
        'lokasi': lokasi,
        'jumlah': jumlah,
        'deskripsi': deskripsi,
      };

      var response = await http.post(
        Uri.parse('https://inma-app.herokuapp.com/api/barang'),
        body: body,
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return BarangModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<BarangModel>> getBarangs() async {
    try {
      var response = await http.get(
        Uri.parse('https://inma-app.herokuapp.com/api/barang'),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<BarangModel> barangs = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((barang) {
          barangs.add(BarangModel.fromJson(barang));
        });

        return barangs;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<BarangModel>> getBarangbyId(String id) async {
    try {
      var response = await http
          .get(Uri.parse('https://inma-app.herokuapp.com/api/barang/$id'));

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<BarangModel> barangs = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((barang) {
          barangs.add(BarangModel.fromJson(barang));
        });

        return barangs;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<BarangModel?> updateBarang(String id, String nama, String lokasi,
      String jumlah, String deskripsi) async {
    try {
      var body = {
        'nama': nama,
        'lokasi': lokasi,
        'jumlah': jumlah,
        'deskripsi': deskripsi,
      };

      var response = await http.post(
        Uri.parse('https://inma-app.herokuapp.com/api/barang/$id'),
        body: body,
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return BarangModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<BarangModel?> delete(String id) async {
    var response = await http
        .delete(Uri.parse('https://inma-app.herokuapp.com/api/barang/$id'));
  }
}
