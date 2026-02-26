import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rently_app/LoginPage.dart';
import 'package:rently_app/UiHelper.dart';
import 'package:rently_app/main.dart';

class Signup extends StatefulWidget {

  @override
  State<StatefulWidget> createState() =>_SignUpPage();
}


class _SignUpPage extends State<Signup>{
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  Signup(String email,String password) async {
    if(email == "" && password == ""){
      UiHelper.CustomAlertBox(context, "Enter the required field");
    }
    else{
      UserCredential? usercredential ;
      try{
        usercredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }

    on FirebaseAuthException catch (ex) {
      return UiHelper.CustomAlertBox(context, ex.code.toString());
    }
    }
  }
  @override 
  Widget build(BuildContext context){

    return Scaffold(
      appBar:  AppBar(
        title: Text("Sign Up",style: TextStyle(fontSize: 25,color: Colors.black54),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
          UiHelper.CustomTextField(emailcontroller, "Register Email", Icons.email, false),
          
          UiHelper.CustomTextField(passwordcontroller, "password", Icons.password, true),


          UiHelper.CustomButton((){
            Signup(emailcontroller.text.toString(), passwordcontroller.text.toString());
          }, "signup"),
          SizedBox(height: 30),

        ],
      ),
    );
  }
}