import 'package:flutter/material.dart';

Color blueFont = Color(0xFF153E73);
Color pinkFont = Color(0xFFF02756);

Container miniCategoryCard(label, assetImageLoc) => Container(
      width: 80,
      margin: EdgeInsets.only(right: 8),
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
          )
        ],
      ),
    );

Container foodCard(label, price, AssetImageLoc, isFavorite) => Container(
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
