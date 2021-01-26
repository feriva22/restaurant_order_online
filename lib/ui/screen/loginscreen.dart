import 'package:flutter/material.dart';
import 'package:restaurant_order_online/ui/component/topConvexClipper.dart';
import 'package:restaurant_order_online/ui/styles/color.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_order_online/models/auth.dart';

class loginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => loginScreenState();
}

class loginScreenState extends State<loginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heightDevice = MediaQuery.of(context).size.height;
    double widthDevice = MediaQuery.of(context).size.width;

    Widget _loginBtn() {
      return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: themeColor,
          elevation: 5.0,
          shadowColor: Colors.grey,
          minimumSize: Size(widthDevice, 50),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        icon: Image.asset(
          "assets/images/google.png",
          height: 40,
          width: 40,
        ),
        label: Text(
          "Login dengan Google",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        onPressed: () async {
          bool isLogin = await context.read<AuthProvider>().login();
          print(isLogin);
          if (!isLogin) {
            Fluttertoast.showToast(
                msg: 'Failed Login',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.red,
                textColor: Colors.white);
          } else {
            Navigator.of(context).pushReplacementNamed('/dashboard');
          }
        },
      );
    }

    return Scaffold(
      body: new Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg-palemquin.png"),
                    fit: BoxFit.cover)),
          ),
          ClipPath(
            clipper: new topConvexClipper(),
            child: Container(
              width: widthDevice,
              height: heightDevice,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
              ),
              child: Container(
                margin: EdgeInsets.only(top: heightDevice * 0.2),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        height: 150,
                        child: Image.asset(
                          "assets/images/palemquinresto-logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Selamat Datang",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                    Text(
                      "Griya Sate",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Text(
                      "Palemquin Resto",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Mojokerto",
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    _loginBtn()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
