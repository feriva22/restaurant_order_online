import 'package:flutter/material.dart';

class customNavBar extends StatelessWidget {
  customNavBar(this.currentIdx);

  final int currentIdx;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color themeColor = Color(0xFFFF0A0A).withOpacity(0.8);
    Color activeNav = Color(0xFF20D0C4);
    Color disabledNav = Colors.grey;

    return Positioned(
      bottom: 10,
      child: Container(
        width: size.width,
        height: 70,
        //color: Colors.black,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(size.width, 70),
              painter: BNBCustomPainter(),
            ),
            Center(
              child: FloatingActionButton(
                onPressed: () {
                  print("Tombol ditekan");
                },
                backgroundColor: Colors.red,
                child: Icon(Icons.shopping_basket_outlined),
                elevation: 3,
              ),
            ),
            Container(
              width: size.width,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home_outlined,
                      color: currentIdx == 0 ? activeNav : disabledNav,
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.store_mall_directory_outlined,
                        color: currentIdx == 1 ? activeNav : disabledNav),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/foods');
                    },
                  ),
                  Container(
                    width: size.width * 0.2,
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_border_outlined,
                        color: currentIdx == 2 ? activeNav : disabledNav),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/favorite');
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.person_outline,
                        color: currentIdx == 3 ? activeNav : disabledNav),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/profile');
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path()..moveTo(size.width * 0.12, 0);
    path.arcToPoint(Offset(size.width * 0.12, size.height),
        radius: Radius.circular(10), clockwise: false);
    path.lineTo(size.width * 0.4, size.height);
    path.quadraticBezierTo(
        size.width * 0.35, size.height / 2, size.width * 0.4, 0);
    path.moveTo(size.width * 0.6, 0);
    path.quadraticBezierTo(
        size.width * 0.65, size.height / 2, size.width * 0.6, size.height);
    path.lineTo(size.width * 0.88, size.height);
    path.arcToPoint(Offset(size.width * 0.88, 0),
        radius: Radius.circular(10), clockwise: false);

    canvas.drawShadow(path, Colors.black45, 3.0, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
