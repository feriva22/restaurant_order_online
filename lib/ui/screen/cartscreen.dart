import 'package:flutter/material.dart';
import 'package:restaurant_order_online/ui/component/card.dart';
import 'package:restaurant_order_online/ui/component/customNavBar.dart';

class cartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color themeColor = Color(0xFFFF0A0A);
    Size size = MediaQuery.of(context).size;

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
                  onPressed: () {},
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
    Color blueFont = Color(0xFF153E73);

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

Widget orderTypeCard({isDelivery}) => Container(
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
    );

class menuInCartArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          menuCartCard("Sate Lulur Hot", "25K", "1",
              "assets/images/foods/sate-lulur.jpg"),
          menuCartCard("Sate Gurame", "120K", "2",
              "assets/images/foods/sate-gurame.png"),
          menuCartCard("Sambel Tempe", "25K", "1",
              "assets/images/foods/sambel-tempe.png")
        ],
      ),
    );
  }
}

class summaryCartArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color blueFont = Color(0xFF153E73);

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
              Text("Rp170.000",
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
              Text("Rp170.000",
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
