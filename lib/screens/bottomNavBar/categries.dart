import 'package:flutter/material.dart';
import 'package:vibes_store/shared/sharedColor.dart';
import 'package:vibes_store/shared/sharedFontStyle.dart';
import 'package:vibes_store/allLists.dart';
import 'package:vibes_store/widgets/rowWidget.dart';
import 'package:vibes_store/screens/productsOfCategories.dart';

class Categries extends StatefulWidget {
  const Categries({Key? key}) : super(key: key);

  @override
  _CategriesState createState() => _CategriesState();
}

class _CategriesState extends State<Categries> {
  List<Map<String, dynamic>> categriesList = [
    {
      'name': 'All Items',
      'showList' : mostSallingItems,
    },
    {
      'name': 'Offers',
      'showList' : offerWidget,
    },
    {
      'name': 'Watches',
      'showList' : mostSallingItems,
    },
    {
      'name': 'Smart Watches',
      'showList' : mostSallingItems,
    },
    {
      'name': 'Bands',
      'showList' : mostSallingItems,
    },
    {
      'name': 'AirPods',
      'showList' : mostSallingItems,
    },
    {
      'name': 'Electronics',
      'showList' : offerWidget,
    },
    {
      'name': 'Bags',
      'showList' : mostSallingItems,
    },
    {
      'name': 'Wallets',
      'showList' : mostSallingItems,
    },
  ];
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
                  child: Text(
                    'Categry Search',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: categriesList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return ProductsOfCategories(categriesList[index]['showList']);
                          }));
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: appBarAndButtonColor,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.08),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(categriesList[index]['name']),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          
        ],
      ),
    );
  }
}
