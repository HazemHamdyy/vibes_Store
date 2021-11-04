import 'package:flutter/material.dart';
import 'package:vibes_store/screens/itemsAndOffersScreen.dart';
import 'package:vibes_store/shared/sharedColor.dart';
import 'package:vibes_store/shared/sharedFontStyle.dart';
import 'package:vibes_store/allLists.dart';
import 'package:vibes_store/widgets/rowWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String,dynamic>> keepList = keepLookingForList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarAndButtonColor,
        title: GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Icon(Icons.search),
              Container(
                child: Text('Search on Vibes Store'),
              ),
            ],
          ),
        ),
        actions: [
          Container(
              height: 30,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://scontent.fcai20-1.fna.fbcdn.net/v/t1.6435-9/243779226_119985923744579_4273602820870637191_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=7k68egYiFM0AX8WTOUf&tn=PObZjSOWgS5MuAKJ&_nc_ht=scontent.fcai20-1.fna&oh=5b0654343da43c1c44205c082002540c&oe=617E4EF0'),
                    fit: BoxFit.fill),
              ))
        ],
      ),
      body: ListView(
        children: [
          Container(
              margin: EdgeInsets.all(10.0),
              child: Text(
                'Best Offers',
                style: mainTextStyle,
              )),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: offerWidget.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          
                         addToKeepList(offerWidget, index);
                      offerWidget[index]['keepLookingFor'] = true;
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return ItemsAndOffersScreen(offerWidget, index);
                          }));
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.2,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            image: DecorationImage(
                                image:
                                    NetworkImage(offerWidget[index]['image']),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 20,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: ListTile(
                              title: Text(offerWidget[index]['name']),
                              subtitle: Text(offerWidget[index]['price']),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.1,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    offerWidget[index]['isFav'] =
                                        !offerWidget[index]['isFav'];
                                    offerWidget[index]['isFav'] == true
                                        ? favOffersWidget
                                            .insert(0,offerWidget[index])
                                        : favOffersWidget
                                            .remove(offerWidget[index]);
                                  });
                                },
                                icon: offerWidget[index]['isFav'] == false
                                    ? Icon(
                                        Icons.favorite_border_outlined,
                                      )
                                    : Icon(Icons.favorite)),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text(
              'Most Salling items',
              style: mainTextStyle,
            ),
          ),
          RowWidget(mostSallingItems),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text(
              'Keep Looking For',
              style: mainTextStyle,
            ),
          ),
          
          RowWidget(keepLookingForList),
        ],
      ),
    );
  }
}
