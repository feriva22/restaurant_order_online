import 'package:flutter/material.dart';
import 'package:restaurant_order_online/ui/component/card.dart';
import 'package:restaurant_order_online/ui/component/customNavBar.dart';

class foodScreen extends StatelessWidget {
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
          children: [categoryArea(), productArea()],
        ),
        customNavBar(1)
      ]),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: FloatingActionButton(
          heroTag: "filterBtn",
          onPressed: () {},
          child: Icon(Icons.filter_alt_outlined),
          backgroundColor: Colors.grey,
        ),
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
          ],
        ),
        Container(
          height: 110,
          width: widthDevice,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              miniCategoryCard("Semua", "assets/images/all-food.png"),
              miniCategoryCard("Minuman", "assets/images/minuman-categ.png"),
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

class productArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heightDevice = MediaQuery.of(context).size.height;
    double widthDevice = MediaQuery.of(context).size.width;

    return Column(children: [
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
                    "assets/images/foods/sate-lulur.jpg", false),
                Spacer(),
                foodCard("Sate Gurame", "60K/Porsi",
                    "assets/images/foods/sate-gurame.png", false),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              children: [
                foodCard("Sate Gurame", "60K/Porsi",
                    "assets/images/foods/sate-gurame.png", false),
                Spacer(),
                foodCard("Sambel Tempe", "25K/Porsi",
                    "assets/images/foods/sambel-tempe.png", true)
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              children: [
                foodCard("Sate Gurame", "60K/Porsi",
                    "assets/images/foods/sate-gurame.png", false),
                Spacer(),
                foodCard("Sambel Tempe", "25K/Porsi",
                    "assets/images/foods/sambel-tempe.png", true)
              ],
            ),
          ],
        ),
      )
    ]);
  }
}
