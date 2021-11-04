import 'package:flutter/material.dart';
import 'package:vibes_store/shared/sharedColor.dart';
import 'package:vibes_store/shared/sharedFontStyle.dart';
import 'package:vibes_store/allLists.dart';
import 'package:vibes_store/widgets/snack.dart';
import 'package:vibes_store/screens/Order.dart';

class ItemsAndOffersScreen extends StatefulWidget {
  final List currentList;
  final int showItemIndex;
  const ItemsAndOffersScreen(this.currentList, this.showItemIndex);

  @override
  _ItemsAndOffersScreenState createState() => _ItemsAndOffersScreenState();
}

class _ItemsAndOffersScreenState extends State<ItemsAndOffersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarAndButtonColor,
      ),
      body: Container(
          child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  image: DecorationImage(
                      image: NetworkImage(
                          widget.currentList[widget.showItemIndex]['image']),
                      fit: BoxFit.fill)),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.builder(
              itemCount: widget
                  .currentList[widget.showItemIndex]['extraImages'].length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      image: DecorationImage(
                          image: NetworkImage(
                              widget.currentList[widget.showItemIndex]
                                  ['extraImages'][index]),
                          fit: BoxFit.fill)),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(
                widget.currentList[widget.showItemIndex]['name'],
                style: mainTextStyle,
              ),
              subtitle: Text(
                widget.currentList[widget.showItemIndex]['price'],
                style: subTextStyle,
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(10.0),
              height: MediaQuery.of(context).size.height * 0.075,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.currentList[widget.showItemIndex]
                            ['wantToOrder'] = true;
                        orderList.add(widget.currentList[widget.showItemIndex]);
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Order();
                        }));
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: MediaQuery.of(context).size.height * 0.075,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(
                          color: appBarAndButtonColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          'Order Now',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.025),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        ScaffoldMessenger.of(context).showSnackBar(snack(
                            'Product Added Successfully To My Cart',
                            Colors.green));
                        if (widget.currentList[widget.showItemIndex]
                                ['inMyCart'] ==
                            false) {
                          myCart.add(widget.currentList[widget.showItemIndex]);
                        }

                        widget.currentList[widget.showItemIndex]['inMyCart'] =
                            true;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: MediaQuery.of(context).size.height * 0.075,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(
                          color: appBarAndButtonColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Text(
                              ' Add To Cart ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.025),
                            ),
                            Icon(
                              Icons.add_shopping_cart,
                              size: MediaQuery.of(context).size.width * 0.03,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            '    Product Description',
            style: mainTextStyle,
          ),
          SizedBox(
            height: 20,
          )
        ],
      )),
    );
  }
}
