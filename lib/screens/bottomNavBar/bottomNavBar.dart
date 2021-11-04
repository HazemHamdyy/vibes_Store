import 'package:flutter/material.dart';
import 'package:vibes_store/screens/bottomNavBar/homePage.dart';
import 'package:vibes_store/screens/bottomNavBar/fav.dart';
import 'package:vibes_store/screens/bottomNavBar/categries.dart';
import 'package:vibes_store/screens/bottomNavBar/myAccount.dart';
import 'package:vibes_store/shared/sharedColor.dart';
import 'package:vibes_store/shared/sharedFontStyle.dart';
import 'package:vibes_store/screens/bottomNavBar/myCart.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({ Key? key }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int current = 0;
  List<Widget> screens = [HomePage(),Favourite(),MyCart(),Categries(),MyAcoount()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.home),label: 'Home',backgroundColor: appBarAndButtonColor ),
          BottomNavigationBarItem(icon:Icon(Icons.favorite_sharp),label: 'Favourite',backgroundColor: appBarAndButtonColor),
          BottomNavigationBarItem(icon:Icon(Icons.shopping_cart_outlined),label: 'My Cart',backgroundColor: appBarAndButtonColor),
          BottomNavigationBarItem(icon:Icon(Icons.category),label: 'Category',backgroundColor: appBarAndButtonColor),
          BottomNavigationBarItem(icon:Icon(Icons.account_box),label: 'My Account',backgroundColor: appBarAndButtonColor)
        ],
        
        
        type: BottomNavigationBarType.shifting,
        currentIndex: current,
        onTap: (index) {
          setState(() {
            current=index;
          }
          );
        },
      ),
      body: screens[current],
      
    );
  }
}