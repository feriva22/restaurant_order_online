import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurant_order_online/ui/component/card.dart';
import 'package:restaurant_order_online/ui/component/customNavBar.dart';
import 'package:restaurant_order_online/ui/component/customAppBar.dart';

import 'package:restaurant_order_online/ui/styles/color.dart';

import 'package:provider/provider.dart';
import 'package:restaurant_order_online/models/category.dart';
import 'package:restaurant_order_online/models/menu.dart';

class foodScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => foodScreenState();
}

class foodScreenState extends State<foodScreen> {
  Future<List<CategoryMenu>> listCategoryMenu;
  StreamController<List<MenuItem>> listMenu;
  int selectedIdx = 0;
  CategoryMenu selectedCategory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.listCategoryMenu =
        Provider.of<CategoryModel>(context, listen: false).getListCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Builder(builder: (BuildContext context) {
        return Stack(children: [
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
        ]);
      }),
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

  Widget categoryArea() {
    return Builder(
      builder: (BuildContext context) {
        Size size = MediaQuery.of(context).size;

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
                child: FutureBuilder<List<CategoryMenu>>(
                  future: listCategoryMenu,
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            CategoryMenu category = snapshot.data[index];
                            if (selectedIdx == index) {
                              selectedCategory = category;
                            }
                            return categoryItem(category, index);
                          });
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                )),
          ],
        );
      },
    );
  }

  Widget categoryItem(CategoryMenu category, index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIdx = index;
          selectedCategory = category;
        });
      },
      child: Container(
        width: 80,
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: selectedIdx == index
              ? Colors.black.withOpacity(0.2)
              : Colors.transparent,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 70,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(category.asset)),
            ),
            Flexible(
              child: Text(
                category.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: blueFont,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget productArea() {
    return Builder(
      builder: (BuildContext context) {
        var menuList = context.watch<MenuModel>();
        return Expanded(
          child: GridView.count(
              padding:
                  EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 150),
              crossAxisSpacing: 5,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 0.9,
              children: List.generate(menuList.getTotalItem(), (index) {
                return menuCard(index);
              })),
        );
      },
    );
  }
}
