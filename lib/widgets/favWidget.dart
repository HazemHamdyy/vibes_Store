import 'package:flutter/material.dart';
import 'package:vibes_store/screens/itemsAndOffersScreen.dart';
import 'package:vibes_store/allLists.dart';

class FavWidget extends StatefulWidget {
  final List favList;

  const FavWidget(this.favList);

  @override
  _FavWidgetState createState() => _FavWidgetState();
}

class _FavWidgetState extends State<FavWidget> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.favList.length,
          itemBuilder: (context, index) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.37,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      addToKeepList(widget.favList, index);
                      widget.favList[index]['keepLookingFor'] = true;
                     // keepLookingForList.add(widget.favList[index]);
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return ItemsAndOffersScreen(widget.favList, index);
                      }));
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.favList[index]['image']),
                                fit: BoxFit.fill)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: 20,
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: ListTile(
                                title: Text(widget.favList[index]['name']),
                                subtitle: Text(widget.favList[index]['price']),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.favList[index]['isFav'] =
                                          !widget.favList[index]['isFav'];
                                      widget.favList
                                          .remove(widget.favList[index]);
                                    });
                                  },
                                  icon: widget.favList[index]['isFav'] == false
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
                ),
              ),
            );
          }),
    );
  }
}
