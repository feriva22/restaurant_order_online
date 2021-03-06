import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_order_online/ui/styles/color.dart';

import 'package:restaurant_order_online/ui/component/card.dart';
import 'package:restaurant_order_online/ui/component/customNavBar.dart';

import 'package:restaurant_order_online/models/cart.dart';

class cartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var cart = context.watch<CartModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Keranjang",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: themeColor, fontSize: 22, fontWeight: FontWeight.w700),
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 80),
            children: [
              orderTypeArea(),
              SizedBox(height: 10),
              menuInCartArea(),
              SizedBox(
                height: 10,
              ),
              Container(
                  margin: EdgeInsets.only(right: 10), child: summaryCartArea()),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    elevation: 5.0,
                    shadowColor: Colors.grey,
                    minimumSize: Size(size.width, 50),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  child: Text(
                    "Checkout",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  onPressed: cart.items.length > 0 ? () {} : null,
                ),
              )
            ],
          ),
          customNavBar()
        ],
      ),
    );
  }
}

class orderTypeArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Pilih jenis pemesanan :",
            style: TextStyle(
                color: blueFont, fontSize: 16, fontWeight: FontWeight.w700)),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              orderTypeCard(isDelivery: false),
              orderTypeCard(isDelivery: true),
            ],
          ),
        )
      ],
    );
  }
}

class orderTypeCard extends StatelessWidget {
  final bool isDelivery;
  orderTypeCard({this.isDelivery});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDelivery
          ? () {}
          : () {
              Navigator.of(context).pushNamed('/reservation');
            },
      child: Container(
        width: 160,
        margin: EdgeInsets.only(right: 8),
        child: Card(
          color: isDelivery ? Colors.grey[400] : Colors.red,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 4,
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              (isDelivery
                  ? Icon(Icons.local_shipping)
                  : Icon(
                      Icons.restaurant,
                      color: Colors.white,
                    )),
              SizedBox(
                width: 5,
              ),
              Text(
                isDelivery ? "Diantar" : "Makan diresto",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: isDelivery ? Colors.black : Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class menuInCartArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();

    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: cart.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext ctx, int index) {
            return MenuCart(cart.items[index]);
          }),
    );
  }
}

class summaryCartArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var cart = context.watch<CartModel>();

    return Card(
      child: Container(
        width: size.width,
        height: 100,
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: Column(
          children: [
            Row(children: [
              Text("Subtotal",
                  style: TextStyle(
                      color: blueFont,
                      fontSize: 13,
                      fontWeight: FontWeight.w500)),
              Spacer(),
              Text("Rp" + cart.subTotalPrice.toString(),
                  style: TextStyle(
                      color: blueFont,
                      fontSize: 13,
                      fontWeight: FontWeight.w500)),
            ]),
            Row(children: [
              Text("Diskon",
                  style: TextStyle(
                      color: blueFont,
                      fontSize: 13,
                      fontWeight: FontWeight.w500)),
              Spacer(),
              Text("-",
                  style: TextStyle(
                      color: blueFont,
                      fontSize: 13,
                      fontWeight: FontWeight.w500)),
            ]),
            Row(children: [
              Text("Total:",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 17,
                      fontWeight: FontWeight.w700)),
              Spacer(),
              Text("Rp" + cart.finalTotalPrice.toString(),
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 17,
                      fontWeight: FontWeight.w700)),
            ]),
          ],
        ),
      ),
    );
  }
}
