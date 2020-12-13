import 'package:flutter/material.dart';

Widget logo(context) {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(top: 120),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 240,
        child: Stack(
          children: [
            Positioned(
                child: Container(
              child: Align(
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  width: 150,
                  height: 150,
                ),
                alignment: Alignment.center,
              ),
              height: 154,
            )),
            Positioned(
              child: Container(
                height: 154,
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "GO",
                    style: TextStyle(
                        fontSize: 120,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),
            Positioned(
              width: 60,
              height: 60,
              top: 140,
              left: 260,
              child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white)),
            ),
            Positioned(
              width: 30,
              height: 30,
              top: 200,
              left: 230,
              child: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
