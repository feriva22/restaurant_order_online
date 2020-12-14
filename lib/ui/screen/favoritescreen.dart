import 'package:flutter/material.dart';
import 'package:restaurant_order_online/ui/component/card.dart';
import 'package:restaurant_order_online/ui/component/customNavBar.dart';

class favoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double heightDevice = MediaQuery.of(context).size.height;
    double widthDevice = MediaQuery.of(context).size.width;
    Color themeColor = Color(0xFFFF0A0A).withOpacity(0.8);

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          alignment: Alignment.centerLeft,
          child: IconButton(
              icon: Icon(Icons.search),
              color: Colors.grey,
              tooltip: 'Cari',
              onPressed: () {}),
        ),
        leadingWidth: widthDevice * 0.3,
        title: Text(
          "Palemquin",
          style: TextStyle(
              color: themeColor, fontSize: 22, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_active_outlined),
            color: Color(0xff20D0C4),
            tooltip: 'Notifikasi',
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset("assets/images/discount-icon.png"),
            color: Colors.red,
            tooltip: 'Diskon & Promo',
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(children: [
        ListView(
          padding: EdgeInsets.only(left: 10, top: 20, bottom: 80),
          children: [favoriteProductArea()],
        ),
        customNavBar(2)
      ]),
    );
  }
}

class favoriteProductArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heightDevice = MediaQuery.of(context).size.height;
    double widthDevice = MediaQuery.of(context).size.width;

    return Column(children: [
      Row(
        children: [
          Text("Masakan Favorit anda",
              style: TextStyle(
                  color: blueFont, fontSize: 16, fontWeight: FontWeight.w700)),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        width: widthDevice,
        padding: EdgeInsets.only(right: 10),
        child: Column(
          children: [
            Row(
              children: [
                foodCard("Sate Lulur", "25K/Porsi",
                    "assets/images/foods/sate-lulur.jpg", true),
                Spacer(),
                foodCard("Sate Gurame", "60K/Porsi",
                    "assets/images/foods/sate-gurame.png", true),
              ],
            ),
          ],
        ),
      )
    ]);
  }
}
