import 'package:flutter/material.dart';
import 'package:vibes_store/allLists.dart';
import 'package:vibes_store/screens/itemsAndOffersScreen.dart';
import 'package:vibes_store/screens/bottomNavBar/homePage.dart';
import 'package:vibes_store/model.dart';

class RowWidget extends StatefulWidget {
  final List myList;
  const RowWidget(this.myList);

  @override
  _RowWidgetState createState() => _RowWidgetState();
}

class _RowWidgetState extends State<RowWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1,
          crossAxisCount: 2,
        ),
        itemCount: widget.myList.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      addToKeepList(widget.myList, index);
                      widget.myList[index]['keepLookingFor'] = true;
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return ItemsAndOffersScreen(widget.myList, index);
                      }));
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        image: DecorationImage(
                            image: NetworkImage(widget.myList[index]['image']),
                            fit: BoxFit.fill)),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 20,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: ListTile(
                          title: Text(widget.myList[index]['name']),
                          subtitle: Text(widget.myList[index]['price']),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.07,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                addToFav(widget.myList, index);
                              });
                            },
                            icon: widget.myList[index]['isFav'] == false
                                ? Icon(
                                    Icons.favorite_border_outlined,
                                  )
                                : Icon(Icons.favorite)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
