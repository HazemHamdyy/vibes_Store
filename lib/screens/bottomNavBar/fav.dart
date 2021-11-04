import 'package:flutter/material.dart';
import 'package:vibes_store/shared/sharedColor.dart';
import 'package:vibes_store/shared/sharedFontStyle.dart';
import 'package:vibes_store/allLists.dart';
import 'package:vibes_store/widgets/favWidget.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarAndButtonColor,
        title: Container(
          width: MediaQuery.of(context).size.width * 0.35,
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Icon(Icons.search),
                Container(
                  child: Text('Favourite Search'),
                )
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text(
              'My Favourite Offers',
              style: mainTextStyle,
            ),
          ),
          favOffersWidget.isEmpty? Center(
            child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                          color: appBarAndButtonColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          'There\'s No Favourite Offers',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
          ):
          FavWidget(favOffersWidget,),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text(
              'My Favourite Products',
              style: mainTextStyle,
            ),
          ),
           favItemsWidget.isEmpty? Center(
            child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                          color: appBarAndButtonColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          'There\'s No Favourite Products',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
          ):
          FavWidget(favItemsWidget),
        ],
      ),
    );
  }
}
