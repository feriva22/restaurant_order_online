import 'package:flutter/material.dart';
import 'package:restaurant_order_online/ui/component/card.dart';
import 'package:restaurant_order_online/ui/component/customNavBar.dart';
import 'package:restaurant_order_online/ui/component/customAppBar.dart';

import 'package:restaurant_order_online/ui/styles/color.dart';

import 'package:provider/provider.dart';
import 'package:restaurant_order_online/models/category.dart';
import 'package:restaurant_order_online/models/menu.dart';

class dashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => dashboardScreenState();
}

class dashboardScreenState extends State<dashboardScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: customAppBar(),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 80),
            children: [
              categoryArea(),
              popularArea(),
              SizedBox(height: 10),
              promoArea()
            ],
          ),
          customNavBar(currentIdx: 0)
        ],
      ),
    );
  }
}

class categoryArea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => categoryAreaState();
}

class categoryAreaState extends State<categoryArea> {
  Future<List<CategoryMenu>> listCategoryMenu;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.listCategoryMenu =
        Provider.of<CategoryModel>(context, listen: false).getListCategory();
  }

  @override
  Widget build(BuildContext context) {
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
            Spacer(),
            TextButton(
              child: Text(
                "lihat selengkapnya",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              onPressed: () {},
            )
          ],
        ),
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
                        return miniCategoryCard(index, snapshot.data[index]);
                      });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center(child: CircularProgressIndicator());
              },
            )),
      ],
    );
  }
}

class popularArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var menuList = context.watch<MenuModel>();

    return Column(children: [
      Row(
        children: [
          Text("Masakan TerPopuler",
              style: TextStyle(
                  color: blueFont, fontSize: 16, fontWeight: FontWeight.w700)),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        height: 200,
        width: size.width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: menuList.getTotalItem(isPopular: true),
            itemBuilder: (BuildContext ctx, int index) {
              return menuCard(index, isPopular: true);
            }),
      ),
    ]);
  }
}

class promoArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heightDevice = MediaQuery.of(context).size.height;
    double widthDevice = MediaQuery.of(context).size.width;

    return Column(children: [
      Row(
        children: [
          Text("Promo",
              style: TextStyle(
                  color: blueFont, fontSize: 16, fontWeight: FontWeight.w700)),
          Spacer(),
          TextButton(
            child: Text(
              "lihat selengkapnya",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            onPressed: () {},
          )
        ],
      ),
      Container(
          height: 150,
          width: widthDevice,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            promoCard("Minuman", "Beli 3 Jus rasa terserah, hanya 30K", "30K",
                "assets/images/foods/minuman.png"),
            promoCard(
                "Minuman",
                "Beli 3 jus rasa apa saja gratis 1 porsi sate ayam",
                "30K",
                "assets/images/foods/minuman.png")
          ]))
    ]);
  }
}
