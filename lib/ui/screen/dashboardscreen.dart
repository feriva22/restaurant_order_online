import 'package:flutter/material.dart';
import 'package:restaurant_order_online/ui/component/card.dart';
import 'package:restaurant_order_online/ui/component/customNavBar.dart';
import 'package:restaurant_order_online/ui/component/customAppBar.dart';

import 'package:restaurant_order_online/ui/styles/color.dart';

class dashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heightDevice = MediaQuery.of(context).size.height;
    double widthDevice = MediaQuery.of(context).size.width;

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

class categoryArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heightDevice = MediaQuery.of(context).size.height;
    double widthDevice = MediaQuery.of(context).size.width;

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
          width: widthDevice,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              miniCategoryCard("Nasi Kotak", "assets/images/nasi-kotak.png"),
              miniCategoryCard("Aqiqah", "assets/images/aqiqah.png"),
              miniCategoryCard("Tumpeng", "assets/images/tumpeng.png"),
              miniCategoryCard("Prasmanan", "assets/images/prasmanan.png"),
              miniCategoryCard(
                  "Kambing Guling", "assets/images/kambing-guling.png"),
            ],
          ),
        ),
      ],
    );
  }
}

class popularArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heightDevice = MediaQuery.of(context).size.height;
    double widthDevice = MediaQuery.of(context).size.width;

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
        width: widthDevice,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            foodCard("Sate Lulur", "25K/Porsi",
                "assets/images/foods/sate-lulur.jpg", false, onchoose: () {
              Navigator.pushNamed(context, '/detailproduct');
            }),
            foodCard("Sate Gurame", "60K/Porsi",
                "assets/images/foods/sate-gurame.png", false),
            foodCard("Sambel Tempe", "25K/Porsi",
                "assets/images/foods/sambel-tempe.png", true)
          ],
        ),
      )
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
