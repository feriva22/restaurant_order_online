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
      body: Stack(children: [customNavBar(1)]),
    );
  }
}
