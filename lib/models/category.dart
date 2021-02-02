import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:restaurant_order_online/models/auth.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class CategoryModel with ChangeNotifier {
  static List<Map<String, dynamic>> categoryList = [
    {'id': 1, 'name': 'Minuman', 'asset': 'assets/images/minuman-categ.png'},
    {'id': 2, 'name': 'Nasi Kotak', 'asset': 'assets/images/nasi-kotak.png'},
    {'id': 3, 'name': 'Aqiqah', 'asset': 'assets/images/aqiqah.png'},
    {'id': 4, 'name': 'Tumpeng', 'asset': 'assets/images/tumpeng.png'},
    {'id': 5, 'name': 'Prasmanan', 'asset': 'assets/images/prasmanan.png'},
    {
      'id': 6,
      'name': 'Kambing Guling',
      'asset': 'assets/images/kambing-guling.png'
    },
    {'id': 7, 'name': 'Aneka Sate', 'asset': 'assets/images/sate-categ.jpg'},
    {'id': 8, 'name': 'Penyetan', 'asset': 'assets/images/penyetan-categ.jpg'}
  ];

  AuthProvider authProvider;
  CategoryModel({this.authProvider});

  List<CategoryMenu> _categoryMenu;

  get categoryMenu => _categoryMenu;

  get totalCategory => _categoryMenu?.length ?? 0;

  Future<List<CategoryMenu>> getListCategory() async {
    try {
      if (authProvider.credential != null &&
          authProvider.credential.auth_token != "") {
        String authToken = authProvider.credential.auth_token;
        Response response = await Dio().get(
            env["SERVER_URL"] + "/menu_category",
            options:
                Options(headers: {"authorization": "Bearer " + authToken}));
        _categoryMenu = (response.data as List)
            .map((json) => CategoryMenu.fromJson(json))
            .toList();

        return _categoryMenu;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.statusCode);
        print(e.response.statusCode.toString() + " Data :" + e.response.data);
      }
    }
  }

  int getTotalItem() {
    return categoryList.length;
  }

  CategoryItem getById(int id) {
    var idxCateg = categoryList.indexWhere((cat) => cat["id"] == id);
    return CategoryItem(categoryList[idxCateg]['id'],
        categoryList[idxCateg]['name'], categoryList[idxCateg]['asset']);
  }

  CategoryItem getByPosition(int position) {
    return CategoryItem(categoryList[position]['id'],
        categoryList[position]['name'], categoryList[position]['asset']);
  }
}

@immutable
class CategoryItem {
  final int id;
  final String name;
  final String asset;

  CategoryItem(this.id, this.name, this.asset);
}

class CategoryMenu {
  final int id;
  final String name;
  final int status;
  final String asset;

  CategoryMenu(this.id, this.name, this.status, this.asset);
  CategoryMenu.fromJson(Map<String, dynamic> json)
      : id = json['mnc_id'],
        name = json['mnc_name'],
        status = json['mnc_status'],
        asset = json['mnc_asset'] ?? null;
  @override
  String toString() {
    // TODO: implement toString
    return "{id : $id, name : $name, status : $status, asset : $asset}";
  }
}
