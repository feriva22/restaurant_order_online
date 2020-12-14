import 'package:flutter/material.dart';
import 'package:restaurant_order_online/ui/component/card.dart';
import 'package:restaurant_order_online/ui/component/customNavBar.dart';

class profileScreen extends StatelessWidget {
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
          padding: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 80),
          children: [
            profileInfoArea(),
            SizedBox(
              height: 5,
            ),
            sumarryOrderArea(),
            SizedBox(
              height: 5,
            ),
            profileBtnCard(Icon(Icons.shopping_cart), "Pesanan Saya", context),
            profileBtnCard(Icon(Icons.build), "Konfigurasi Akun", context),
            profileBtnCard(Icon(Icons.exit_to_app), "Keluar", context)
          ],
        ),
        customNavBar(3)
      ]),
    );
  }
}

class sumarryOrderArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        summaryOrderCard(Color(0xFF3EE558), "Complete Order", "10", context),
        summaryOrderCard(Color(0xFFF8D24C), "Pending Order", "1", context),
        summaryOrderCard(Color(0xFFFA6565), "Cancel Order", "0", context),
      ],
    );
  }
}

class profileInfoArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color themeColor = Color(0xFFFF0A0A).withOpacity(0.8);
    Color blueFont = Color(0xFF153E73);

    return Center(
      child: Column(
        children: [
          Container(
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: themeColor, width: 3),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/profile.jpeg")))),
          SizedBox(
            height: 3,
          ),
          Text(
            "FERICO DENO VANDRA",
            style: TextStyle(
                color: blueFont, fontSize: 15, fontWeight: FontWeight.w500),
          ),
          Text(
            "fericodeva69@gmail.com",
            style: TextStyle(
                color: Color(0xff515F65),
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
