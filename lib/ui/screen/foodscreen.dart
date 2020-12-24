import 'package:flutter/material.dart';
import 'package:restaurant_order_online/ui/component/card.dart';
import 'package:restaurant_order_online/ui/component/customNavBar.dart';
import 'package:restaurant_order_online/ui/component/customAppBar.dart';

import 'package:restaurant_order_online/ui/styles/color.dart';

import 'package:provider/provider.dart';
import 'package:restaurant_order_online/models/category.dart';
import 'package:restaurant_order_online/models/menu.dart';

class foodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Stack(children: [
        Column(
          //padding: EdgeInsets.only(left: 10, top: 20, bottom: 150),
          children: [
            Container(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 20,
                ),
                child: Column(
                  children: [
                    categoryArea(),
                    Row(
                      children: [
                        Text("Menu",
                            style: TextStyle(
                                color: blueFont,
                                fontSize: 16,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                )),
            productArea()
          ],
        ),
        customNavBar(currentIdx: 1)
      ]),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: FloatingActionButton(
          heroTag: "filterBtn",
          onPressed: () {},
          child: Icon(Icons.filter_alt_outlined),
          backgroundColor: Color(0xFF20D0C4),
        ),
      ),
    );
  }
}

class categoryArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var categoryList = context.watch<CategoryModel>();

    return Column(
      children: [
        Row(
          children: [
            Text("Kategori",
                style: TextStyle(
                    color: blueFont,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
          ],
        ),
        SizedBox(height: 5),
        Container(
          height: 110,
          width: size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.getTotalItem(),
            itemBuilder: (BuildContext ctx, int index) {
              return miniCategoryCard(index);
            },
          ),
        ),
      ],
    );
  }
}

class productArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var menuList = context.watch<MenuModel>();

    return Expanded(
      child: GridView.count(
          padding: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 150),
          crossAxisSpacing: 5,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: 0.9,
          children: List.generate(menuList.getTotalItem(), (index) {
            return menuCard(index);
          })),
    );
  }
}
