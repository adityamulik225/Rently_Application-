import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rently_app/LoginPage.dart';
import 'package:rently_app/main.dart';

class Splashscreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splashscreen> {
  @override
  void initState(){
    super.initState();

    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 150,
          width: 150,
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
