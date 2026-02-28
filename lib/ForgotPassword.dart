import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rently_app/UiHelper.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailcontroller = TextEditingController();

  ForgotPassword(String email) {
    if (email == "") {
      UiHelper.CustomAlertBox(context, "Enter Required Field ");
    } else {
      FirebaseAuth.instance.verifyPasswordResetCode(email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),


      body: Column(
        children: [
          UiHelper.CustomTextField(
            emailcontroller,
            "Enter your Email",
            Icons.email,
            false,
          ),


          SizedBox(height: 15),


          UiHelper.CustomButton(() {
            ForgotPassword(emailcontroller.text.toString());
          }, "Forgot Password"),
        ],
      ),
    );
  }
}
