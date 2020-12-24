import 'package:flutter/material.dart';

class CategoryModel {
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
