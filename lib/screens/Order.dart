import 'package:flutter/material.dart';
import 'package:vibes_store/allLists.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                itemCount: orderList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: ListTile(
                      title: Text(
                        orderList[index]['name'],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('${orderList[index]['price']}  x${orderList[index]['quantity']}'),
                           Container(
                                          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.01),
                                          
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                orderList[index]['quantity']++;
                                              });
                                            },
                                            icon: Icon(Icons.add),
                                          ),
                                        ),
                                      
                                        Container(
                                          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.01),
                                          
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                orderList[index]['quantity'] != 1
                                                    ? orderList[index]
                                                        ['quantity']--
                                                    : orderList[index]
                                                        ['quantity'] = 1;
                                              });
                                            },
                                            icon: Icon(Icons.remove),
                                          ),
                                        ),
                        ],
                      ),
                      trailing: Image(
                        image: NetworkImage(orderList[index]['image']),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
