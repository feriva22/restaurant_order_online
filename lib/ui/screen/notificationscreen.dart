import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:timeago/timeago.dart';
import 'package:restaurant_order_online/ui/component/card.dart';
import 'package:restaurant_order_online/ui/component/customAppBar.dart';
import 'package:restaurant_order_online/ui/styles/color.dart';

class notificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: customAppBar(noSearch: true, title: "Notifikasi"),
      body: Stack(
        children: [
          ListView(
              padding: EdgeInsets.only(left: 10, top: 20, right: 10),
              children: [
                notifItem("success",
                    title: "Sukses order Makanan",
                    desc: "ID Pesanan 104481",
                    time:
                        new DateTime.now().subtract(new Duration(minutes: 3))),
                notifItem("check_billing",
                    title: "Cek tagihan anda",
                    desc: "ID Pesanan 104481",
                    time:
                        new DateTime.now().subtract(new Duration(minutes: 3))),
                notifItem("sending",
                    title: "Pesanan anda dalam proses pengiriman",
                    desc: "ID Pesanan 10491",
                    time: new DateTime.now().subtract(new Duration(hours: 5))),
                notifItem("error",
                    title: "Pesanan gagal diproses",
                    desc: "ID Pesanan 10499",
                    time: new DateTime.now().subtract(new Duration(hours: 6))),
              ])
        ],
      ),
    );
  }
}

Dismissible notifItem(type, {title: null, desc: null, time: null}) {
  Icon typeIcon;
  double sizeIcon = 40;
  if (type == "success") {
    typeIcon =
        Icon(Icons.check_circle_outline, color: Colors.green, size: sizeIcon);
  } else if (type == "check_billing") {
    typeIcon =
        Icon(Icons.receipt_long_outlined, color: Colors.yellow, size: sizeIcon);
  } else if (type == "sending") {
    typeIcon = Icon(Icons.local_shipping, color: Colors.blue, size: sizeIcon);
  } else if (type == "error") {
    typeIcon =
        Icon(Icons.error_outline_outlined, color: Colors.red, size: sizeIcon);
  } else {
    typeIcon = Icon(Icons.notifications_active_outlined,
        color: activeNav, size: sizeIcon);
  }
  timeago.setLocaleMessages('id', IdMessages());
  timeago.setDefaultLocale('id');

  return Dismissible(
      background: Container(color: Colors.transparent),
      key: Key(title),
      direction: (DismissDirection.endToStart),
      onDismissed: (direction) {},
      child: Card(
          child: ListTile(
        leading: typeIcon,
        title: Text(
          title,
          style: TextStyle(fontSize: 15),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(desc),
            Row(
              children: [
                Icon(Icons.schedule, size: 15),
                SizedBox(
                  width: 3,
                ),
                Text(
                  timeago.format(time),
                ),
              ],
            )
          ],
        ),
      )));
}
