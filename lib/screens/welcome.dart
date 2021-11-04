import 'package:flutter/material.dart';
import 'package:vibes_store/shared/sharedColor.dart';
import 'package:vibes_store/shared/sharedFontStyle.dart';
import 'package:vibes_store/screens/login.dart';


class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://scontent.fcai20-1.fna.fbcdn.net/v/t1.6435-9/243955455_119986817077823_6147790626460861126_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=e3f864&_nc_ohc=bJQPzf7y5NUAX9jfeP7&_nc_ht=scontent.fcai20-1.fna&oh=245f989d732186010d2606949d1f0d1c&oe=61951FD6'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Container(
                  margin: EdgeInsets.all(30),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://scontent.fcai20-1.fna.fbcdn.net/v/t1.6435-9/243779226_119985923744579_4273602820870637191_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=7k68egYiFM0AX8WTOUf&tn=PObZjSOWgS5MuAKJ&_nc_ht=scontent.fcai20-1.fna&oh=5b0654343da43c1c44205c082002540c&oe=617E4EF0'),
                        fit: BoxFit.fill),
                  )),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Login(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
