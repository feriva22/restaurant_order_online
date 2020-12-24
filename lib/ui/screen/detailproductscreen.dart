import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:intl/intl.dart";

import 'package:restaurant_order_online/ui/component/card.dart';

import 'package:restaurant_order_online/ui/styles/color.dart';

import 'package:restaurant_order_online/models/menu.dart';
import 'package:restaurant_order_online/models/cart.dart';

class detailProductScreen extends StatelessWidget {
  MenuItem menu;
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null) menu = arguments['menu'];

    String numbertoPrice(double price) {
      var _formattedNumber = NumberFormat.compactCurrency(
        decimalDigits: 0,
        symbol:
            'Rp', // if you want to add currency symbol then pass that in this else leave it empty.
      ).format(price);
      return _formattedNumber;
    }

    Size size = MediaQuery.of(context).size;
    Widget addToCartBtn = ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: themeColor,
        elevation: 5.0,
        shadowColor: Colors.grey,
        minimumSize: Size(size.width * 0.3, 50),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      child: Text(
        "Masukkan Keranjang",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      onPressed: () {
        var cart = context.read<CartModel>();
        cart.add(menu);
        Navigator.pushReplacementNamed(context, '/cart');
      },
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          menu.name,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0x44000000),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    //image: AssetImage("assets/images/foods/sate-lulur.jpg"),
                    image: AssetImage(menu.asset),
                    fit: BoxFit.cover)),
          ),
          ClipPath(
            clipper: new curvedMenuDetail(),
            child: Container(
              height: size.height,
              width: size.height,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                margin: EdgeInsets.only(top: size.height * 0.4),
                child: ListView(
                  padding: EdgeInsets.only(left: 25, right: 10, top: 0),
                  children: [
                    Text(
                      "Deskripsi",
                      style: TextStyle(
                          color: blueFont,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      menu.description,
                      style: TextStyle(color: blueFont, fontSize: 13),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    additionalMenuArea()
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 80,
              padding: EdgeInsets.only(left: 15, right: 10),
              width: size.width,
              color: Colors.white,
              child: Row(
                children: [
                  addToCartBtn,
                  Spacer(),
                  Text(
                    numbertoPrice(menu.price),
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: blueFont),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.3,
            left: size.width * 0.75,
            child: RaisedButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              color: Color(0xffF1395E),
              elevation: 4,
              shape: CircleBorder(side: BorderSide.none),
              child: Center(
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class additionalMenuArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color blueFont = Color(0xFF153E73);
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Text("Menu Tambahan",
                style: TextStyle(
                    color: blueFont,
                    fontSize: 18,
                    fontWeight: FontWeight.w700)),
            Spacer(),
            Text(
              "3 Menu Tambahan",
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ],
        ),
        Container(
          height: 150,
          width: size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              additionalMenuCard(
                  "Nasi Wakul Kecil", "7k", "assets/images/foods/nasi.png"),
              additionalMenuCard(
                  "Sambal Terasi", "4k", "assets/images/foods/no-image.png"),
              additionalMenuCard(
                  "Sambel pencit", "4k", "assets/images/foods/no-image.png"),
            ],
          ),
        ),
      ],
    );
  }
}

class curvedMenuDetail extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.45);
    path.quadraticBezierTo(size.width * 0.05, size.height * 0.35,
        size.width * 0.2, size.height * 0.35);
    path.lineTo(size.width * 0.9, size.height * 0.35);
    path.quadraticBezierTo(
        size.width * 0.97, size.height * 0.35, size.width, size.height * 0.3);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
