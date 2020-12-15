import 'package:flutter/material.dart';

class topConvexClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, size.height * 0.4) //start ke startPoint penarikan
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
