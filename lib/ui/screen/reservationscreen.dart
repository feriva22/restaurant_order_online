import 'package:flutter/material.dart';
import 'package:restaurant_order_online/ui/styles/color.dart';
import 'package:touchable/touchable.dart';
import 'package:svg_path_parser/svg_path_parser.dart';

class reservationScreen extends StatefulWidget {
  @override
  _reservationScreen createState() => _reservationScreen();
}

class _reservationScreen extends State<reservationScreen> {
  State state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: themeColor, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Pilih Meja untuk Reservasi",
          style: TextStyle(
              color: themeColor, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        color: Colors.grey.shade100,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.6,
        padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: CanvasTouchDetector(
          builder: (context) => CustomPaint(
              //painter: PathPainter(context),
              ),
        ),
      ),
    );
  }
}
