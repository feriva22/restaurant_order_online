import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'category.dart';

class MenuModel {
  static String exampleDesc =
      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat";

  List<Map<String, dynamic>> menuList = [
    {
      'id': 1,
      'categoryId': 7,
      'name': 'Sate Lulur',
      'description': exampleDesc,
      'price': 25000.0,
      'asset': 'assets/images/foods/sate-lulur.jpg',
      'popular': true
    },
    {
      'id': 2,
      'categoryId': 7,
      'name': 'Sate Gurame',
      'description': exampleDesc,
      'price': 60000.0,
      'asset': 'assets/images/foods/sate-gurame.png',
      'popular': true
    },
    {
      'id': 3,
      'categoryId': 8,
      'name': 'Sambel Tempe',
      'description': exampleDesc,
      'price': 20000.0,
      'asset': 'assets/images/foods/sambel-tempe.png',
      'popular': true
    },
    {
      'id': 4,
      'categoryId': 1,
      'name': 'Jus Mangga',
      'description': exampleDesc,
      'price': 10000.0,
      'asset': 'assets/images/foods/minuman.png',
      'popular': false
    },
    {
      'id': 5,
      'categoryId': 1,
      'name': 'Jus Alpukat',
      'description': exampleDesc,
      'price': 10000.0,
      'asset': 'assets/images/foods/no-image.png',
      'popular': false
    },
  ];

  int getTotalItem({isPopular: false}) {
    return isPopular
        ? menuList.where((menu) => menu["popular"]).length
        : menuList.length;
  }

  MenuItem getById(int id) {
    var categoryList = CategoryModel();

    var idxMenu = menuList.indexWhere((menu) => menu["id"] == id);
    return MenuItem(
        menuList[idxMenu]['id'],
        categoryList.getById(menuList[idxMenu]['categoryId']),
        menuList[idxMenu]['name'],
        menuList[idxMenu]['description'],
        menuList[idxMenu]['price'],
        menuList[idxMenu]['asset'],
        menuList[idxMenu]['popular']);
  }

  MenuItem getByPosition(int position, {isPopular: false}) {
    var categoryList = CategoryModel();
    var menus = menuList;
    if (isPopular) {
      menus = List<Map<String, dynamic>>.from(
          menuList.where((menu) => menu["popular"]));
    }
    return MenuItem(
        menus[position]['id'],
        categoryList.getById(menus[position]['categoryId']),
        menus[position]['name'],
        menus[position]['description'],
        menus[position]['price'],
        menus[position]['asset'],
        menus[position]['popular']);
  }
}

class MenuItem {
  final int id;
  final CategoryItem category;
  final String name;
  final String description;
  final double price;
  final String asset;
  final bool popular;

  MenuItem(this.id, this.category, this.name, this.description, this.price,
      this.asset, this.popular);
}
