import 'package:flutter/material.dart';
import 'package:restaurant_order_online/ui/screen/loginscreen.dart';
import 'package:restaurant_order_online/ui/component/card.dart';
import 'package:restaurant_order_online/ui/component/customNavBar.dart';
import 'package:restaurant_order_online/ui/component/customAppBar.dart';
import 'package:restaurant_order_online/ui/styles/color.dart';

import 'package:provider/provider.dart';
import 'package:restaurant_order_online/models/auth.dart';

class profileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double heightDevice = MediaQuery.of(context).size.height;
    double widthDevice = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: customAppBar(),
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
            profileBtnCard(Icon(Icons.exit_to_app), "Keluar", context,
                onTap: () async {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (_) => AlertDialog(
                  title: Text("Yakin ingin logout",
                      style: TextStyle(fontSize: 16)),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Tidak"),
                      textColor: Colors.grey,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<AuthProvider>().logout();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    loginScreen()));
                      },
                      child: Text("Ya"),
                      color: Colors.red,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              );
            })
          ],
        ),
        customNavBar(currentIdx: 3)
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
    return Center(
      child: Column(
        children: [
          Consumer<AuthProvider>(builder: (context, model, widget) {
            if (model.currentUser != null) {
              return Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: themeColor, width: 3),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(model.currentUser.photoUrl))));
            } else {
              return Container();
            }
          }),
          SizedBox(
            height: 3,
          ),
          Consumer<AuthProvider>(
            builder: (context, model, widget) => Text(
              model.profile?.name ?? '', //check for value is null or not with ?
              style: TextStyle(
                  color: blueFont, fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          Consumer<AuthProvider>(
            builder: (context, model, widget) => Text(
              model.currentUser?.email ?? '',
              style: TextStyle(
                  color: Color(0xff515F65),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
