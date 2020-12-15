import 'package:flutter/material.dart';

class customAppBar extends StatelessWidget implements PreferredSizeWidget {
  customAppBar({this.noSearch: false, this.title: null});

  final bool noSearch;
  final String title;

  Color themeColor = Color(0xFFFF0A0A).withOpacity(0.8);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: (!noSearch
          ? Container(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.grey,
                  tooltip: 'Cari',
                  onPressed: () {}),
            )
          : null),
      //leadingWidth: MediaQuery.of(context).size.width * 0.3,
      title: Center(
        child: Text(
          title != null ? title : "Palemquin",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: themeColor, fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.red, //change your color here
      ),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: Icon(Icons.notifications_active_outlined),
          color: Color(0xff20D0C4),
          tooltip: 'Notifikasi',
          onPressed: () {
            if (ModalRoute.of(context).settings.name != '/notification') {
              Navigator.pushNamed(context, '/notification');
            }
          },
        ),
        IconButton(
          icon: Image.asset("assets/images/discount-icon.png"),
          color: Colors.red,
          tooltip: 'Diskon & Promo',
          onPressed: () {
            Navigator.pushNamed(context, '/discount');
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
