import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:may/utility/my_style.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  @override

  // Field sakjdf;asldjf;alsjd sladfalskdjfl;ksadjfl

  // Method
  Widget mySizebox() {
    return SizedBox(
      width: 5.0,
    );
  }

  Widget signUpButton() {
    return Expanded(
      child: OutlineButton(
        borderSide: BorderSide(color: MyStyle().darkColor),
        child: Text('SignUp'),
        onPressed: () {},
      ),
    );
  }

  Widget signInButton() {
    return Expanded(
      child: RaisedButton(
        color: MyStyle().darkColor,
        child: Text(
          'Sigh In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget showButton() {
    return Container(
      color: Colors.lime,
      width: 250.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          signInButton(),
          mySizebox(),
          signUpButton(),
        ],
      ),
    );
  }

  Widget passwordForm() {
    return Container(
      width: 250.0,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(hintText: 'Password :'),
      ),
    );
  }

  Widget userForm() {
    return Container(
      width: 250.0,
      child: TextField(
        decoration: InputDecoration(hintText: 'User :'),
      ),
    );
  }

  Widget showLogo() {
    return Container(
      height: 120.0,
      width: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'GLO MOMAY',
      style: GoogleFonts.tradeWinds(
          textStyle: TextStyle(
        color: MyStyle().darkColor,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
      )),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: <Color>[Colors.white, MyStyle().primaryColor],radius: 4.0,
          ),
        ),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            showLogo(),
            showAppName(),
            userForm(),
            passwordForm(),
            showButton(),
          ],
        )),
      ),
    );
  }
}
