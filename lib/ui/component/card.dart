import 'package:flutter/material.dart';
import "package:intl/intl.dart";

import 'package:restaurant_order_online/ui/styles/color.dart';

import 'package:provider/provider.dart';
import 'package:restaurant_order_online/models/category.dart';
import 'package:restaurant_order_online/models/menu.dart';
import 'package:restaurant_order_online/models/cart.dart';

String numbertoPrice(double price) {
  var _formattedNumber = NumberFormat.compactCurrency(
    decimalDigits: 0,
    symbol:
        'Rp', // if you want to add currency symbol then pass that in this else leave it empty.
  ).format(price);
  return _formattedNumber;
}

class miniCategoryCard extends StatelessWidget {
  final index;
  miniCategoryCard(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categItem = context.select<CategoryModel, CategoryItem>(
      (category) => category.getByPosition(index),
    );
    return Container(
      width: 80,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: false ? Colors.black.withOpacity(0.05) : Colors.transparent,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(categItem.asset),
            ),
          ),
          Flexible(
            child: Text(
              categItem.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: blueFont,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class menuCard extends StatelessWidget {
  final index;
  final isPopular;
  menuCard(this.index, {this.isPopular: false, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var menuItem = context.select<MenuModel, MenuItem>(
      (menu) => menu.getByPosition(index, isPopular: isPopular),
    );

    return Container(
      width: 160,
      child: Card(
        child: Stack(children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 18,
                ),
                Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(menuItem.asset, fit: BoxFit.contain),
                      )),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(menuItem.name,
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 3,
                ),
                Text(numbertoPrice(menuItem.price),
                    style: TextStyle(
                        fontSize: 16,
                        color: blueFont,
                        fontWeight: FontWeight.w700))
              ],
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              icon: false
                  ? Icon(
                      Icons.favorite,
                      color: pinkFont,
                    )
                  : Icon(Icons.favorite_outline),
              iconSize: 20,
            ),
          ),
          Positioned(
              right: 4,
              bottom: 7,
              child: Container(
                width: 30,
                height: 30,
                child: RaisedButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pushNamed(context, '/detailproduct',
                        arguments: {'menu': menuItem});
                  },
                  color: Colors.white,
                  elevation: 2,
                  shape: CircleBorder(side: BorderSide.none),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: blueFont,
                      size: 20,
                    ),
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}

Container foodCard(
  label,
  price,
  AssetImageLoc,
  isFavorite, {
  onchoose = null,
}) =>
    Container(
      width: 160,
      child: Card(
        child: Stack(children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 18,
                ),
                Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(AssetImageLoc, fit: BoxFit.contain),
                      )),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(label,
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 3,
                ),
                Text("Rp" + price,
                    style: TextStyle(
                        fontSize: 16,
                        color: blueFont,
                        fontWeight: FontWeight.w700))
              ],
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              icon: isFavorite
                  ? Icon(
                      Icons.favorite,
                      color: pinkFont,
                    )
                  : Icon(Icons.favorite_outline),
              iconSize: 20,
            ),
          ),
          Positioned(
              right: 4,
              bottom: 7,
              child: Container(
                width: 30,
                height: 30,
                child: RaisedButton(
                  padding: EdgeInsets.zero,
                  onPressed: onchoose != null ? onchoose : () {},
                  color: Colors.white,
                  elevation: 2,
                  shape: CircleBorder(side: BorderSide.none),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: blueFont,
                      size: 20,
                    ),
                  ),
                ),
              )),
        ]),
      ),
    );

Container promoCard(category, detail, price, AssetImageLoc) => Container(
      width: 250,
      child: Card(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        ListTile(
          leading: SizedBox(
              height: 60.0,
              width: 40.0, // fixed width and height
              child: Image.asset(AssetImageLoc)),
          title: Text(category),
          subtitle: Text(detail),
        ),
        Container(
          margin: EdgeInsets.only(left: 70),
          child: Row(
            children: <Widget>[
              Text("Rp" + price,
                  style: TextStyle(
                      fontSize: 16,
                      color: blueFont,
                      fontWeight: FontWeight.w700)),
              Spacer(),
              Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.only(right: 5, bottom: 8),
                child: RaisedButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  color: Colors.white,
                  elevation: 2,
                  shape: CircleBorder(side: BorderSide.none),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: blueFont,
                      size: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ])),
    );

Container summaryOrderCard(Color color, type, total, context) => Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: 100,
      child: Card(
        color: color,
        elevation: 5,
        child: Center(
            child: Column(
          children: [
            Text(type,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
            Text(total,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
          ],
        )),
      ),
    );

Container profileBtnCard(Icon icon, text, context) => Container(
    width: MediaQuery.of(context).size.width,
    height: 60,
    margin: EdgeInsets.only(bottom: 3),
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      elevation: 2,
      child: ListTile(
        leading: icon,
        title: Text(
          text,
          style: TextStyle(
              color: blueFont, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    ));

Container additionalMenuCard(label, price, assetImageLoc) => Container(
      width: 70,
      margin: EdgeInsets.only(right: 4),
      child: Column(
        children: [
          SizedBox(
            height: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(assetImageLoc),
            ),
          ),
          Flexible(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: blueFont,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Flexible(
            child: Text(
              "Rp." + price,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: blueFont,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );

class MenuCart extends StatelessWidget {
  final CartItem cartItem;
  MenuCart(this.cartItem, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 5),
      child: Stack(children: [
        Card(
          child: Center(
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(cartItem.menu.asset,
                            fit: BoxFit.contain),
                      )),
                  Text(cartItem.menu.name,
                      style: TextStyle(
                          color: blueFont,
                          fontSize: 15,
                          fontWeight: FontWeight.w700)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          cart.decreaseQuantity(cartItem);
                        },
                        child: Icon(
                          Icons.remove,
                          size: 20,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Container(
                        color: Colors.grey.shade200,
                        padding: const EdgeInsets.only(
                            bottom: 2, right: 12, left: 12),
                        child: Text(
                          cartItem.quantity.toString(),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          cart.increaseQuantity(cartItem);
                        },
                        child: Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.grey.shade700,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(numbertoPrice(cartItem.totalPrice),
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff20D0C4),
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 30,
              height: 30,
              child: RaisedButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(
                          "Hapus menu ${cartItem.menu.name} dari Keranjang",
                          style: TextStyle(fontSize: 16)),
                      content: Text("Apakah anda yakin ?",
                          style: TextStyle(fontSize: 14)),
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
                            cart.remove(cartItem);
                            Navigator.pop(context);
                          },
                          child: Text("Ya"),
                          color: Colors.red,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  );
                },
                color: Colors.red,
                elevation: 2,
                shape: CircleBorder(side: BorderSide.none),
                child: Center(
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            )),
      ]),
    );
  }
}
