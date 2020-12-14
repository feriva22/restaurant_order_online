import 'package:flutter/material.dart';

class topConvexClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint = Offset(size.width / 2, 0); //control point ditengah
    var endPoint = Offset(
        size.width, size.height * 0.3); //endPoint ketika penarikan bezier

    Path path = Path()
      ..moveTo(0, size.height * 0.4) //start ke startPoint penarikan
      /*..quadraticBezierTo(
          //mulai buat penarikan bezier dari startPoint ke endPoint
          controlPoint.dx,
          controlPoint.dy,
          endPoint.dx,
          endPoint.dy)*/
      ..arcToPoint(Offset(size.width, size.height * 0.4),
          radius: Radius.circular(10), clockwise: true)
      ..lineTo(size.width, size.height) //Buat path sisanya
      ..lineTo(0, size.height)
      ..close(); //close ke startPoint
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
