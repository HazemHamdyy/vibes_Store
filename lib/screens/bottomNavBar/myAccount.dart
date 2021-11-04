import 'package:flutter/material.dart';
import 'package:vibes_store/shared/sharedColor.dart';
import 'package:vibes_store/shared/sharedFontStyle.dart';

class MyAcoount extends StatefulWidget {
  const MyAcoount({Key? key}) : super(key: key);

  @override
  _MyAcoountState createState() => _MyAcoountState();
}

class _MyAcoountState extends State<MyAcoount> {
  List<Map<String, dynamic>> myAccountList = [
    {'name': 'Profile', 'icon': Icons.account_circle_outlined},
    {'name': 'Settings', 'icon': Icons.settings},
    {'name': 'Recent Orders', 'icon': Icons.shopping_cart_outlined},
    {'name': 'About Us', 'icon': Icons.info},
    {'name': 'Contact Us', 'icon': Icons.phone},
    {'name': 'Help', 'icon': Icons.help},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarAndButtonColor,
        title: Text(
          'My Account',
          style: appBarButtonTextStyle,
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: myAccountList.length,
        itemBuilder: (context, index) {
          return Container(
            height: 40.0,
            child: ListTile(
              leading: Icon(myAccountList[index]['icon']),
              title: Text(myAccountList[index]['name']),
            ),
          );
        },
      ),
    );
  }
}
