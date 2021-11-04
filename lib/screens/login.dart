import 'package:flutter/material.dart';
import 'package:vibes_store/shared/sharedFontStyle.dart';
import 'package:vibes_store/shared/sharedColor.dart';


class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
            margin: EdgeInsets.all(30.0),
            child: Text(
              'Login',
              style: mainTextStyle,
            ),
          ),
      ],
    );
  }
}