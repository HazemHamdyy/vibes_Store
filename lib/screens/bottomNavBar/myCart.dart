import 'package:flutter/material.dart';
import 'package:vibes_store/allLists.dart';
import 'package:vibes_store/screens/Order.dart';
import 'package:vibes_store/screens/itemsAndOffersScreen.dart';
import 'package:vibes_store/shared/sharedFontStyle.dart';
import 'package:vibes_store/shared/sharedColor.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarAndButtonColor,
        title: Text(
          'My Cart',
          style: appBarButtonTextStyle,
        ),
      ),
      body: myCart.isEmpty
          ? Center(
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
                    'There\'s Nothing In My Cart',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.76,
                    child: ListView.builder(
                      itemCount: myCart.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              myCart[index]['wantToOrder'] =
                                                  !myCart[index]['wantToOrder'];
                                            });
                                          },
                                          icon: myCart[index]['wantToOrder'] ==
                                                  false
                                              ? Icon(
                                                  Icons.check_box_outline_blank,
                                                  size: 50,
                                                )
                                              : Icon(
                                                  Icons.check_box,
                                                  size: 50,
                                                )),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              showDialog(
                                                context: context,
                                                builder: (_) => AlertDialog(
                                                  title: Text('Are You Sure?'),
                                                  content: Text(
                                                      'You Want To Remove This Product From Cart'),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text('Cancel')),
                                                    TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            myCart[index][
                                                                    'inMyCart'] =
                                                                !myCart[index][
                                                                    'inMyCart'];
                                                            myCart.remove(
                                                                myCart[index]);
                                                            Navigator.pop(
                                                                context);
                                                          });
                                                        },
                                                        child: Text('Yes')),
                                                  ],
                                                ),
                                                barrierDismissible: true,
                                              );
                                            });
                                          },
                                          icon: myCart[index]['inMyCart'] ==
                                                  true
                                              ? Icon(
                                                  Icons
                                                      .remove_shopping_cart_outlined,
                                                  size: 50,
                                                )
                                              : Icon(
                                                  Icons.remove_shopping_cart,
                                                  size: 50,
                                                )),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        keepLookingForList.insert(
                                            0, myCart[index]);
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (_) {
                                          return ItemsAndOffersScreen(
                                              myCart, index);
                                        }));
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(10.0),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.5,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      myCart[index]['image']),
                                                  fit: BoxFit.fill)),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          height: 40,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.35,
                                                child: ListTile(
                                                  title: Text(
                                                      myCart[index]['name']),
                                                  subtitle: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Text(myCart[index]
                                                          ['price']),
                                                     
                                                      
                                                       Text(
                                                            'x${myCart[index]['quantity'].toString()}',
                                                            style: TextStyle(
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.028),
                                                          ),
                                                      
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.15,
                                                child: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        addToFav(myCart, index);
                                                      });
                                                    },
                                                    icon: myCart[index]
                                                                ['isFav'] ==
                                                            false
                                                        ? Icon(
                                                            Icons
                                                                .favorite_border_outlined,
                                                          )
                                                        : Icon(Icons.favorite)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.01),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.075,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                myCart[index]['quantity']++;
                                              });
                                            },
                                            icon: Icon(Icons.add),
                                          ),
                                        ),
                                      
                                        Container(
                                          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.01),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.075,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                myCart[index]['quantity'] != 1
                                                    ? myCart[index]
                                                        ['quantity']--
                                                    : myCart[index]
                                                        ['quantity'] = 1;
                                              });
                                            },
                                            icon: Icon(Icons.remove),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  myCart.isEmpty
                      ? Container()
                      : Center(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                orderNow(myCart);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return Order();
                                }));
                              });
                            },
                            child: Container(
                              //margin: EdgeInsets.all(10.0),
                              height:
                                  MediaQuery.of(context).size.height * 0.075,
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
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
    );
  }
}
