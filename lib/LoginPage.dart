import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rently_app/ForgotPassword.dart';
import 'package:rently_app/SignUp.dart';
import 'package:rently_app/UiHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rently_app/main.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  Future<void> login(String email, String password) async {
    if (email == "" && password == "") {
      UiHelper.CustomAlertBox(context, " Enter the required field ");
    } else {
      try {
        UserCredential? usercredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } on FirebaseAuthException catch (ex) {
        UiHelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(fontSize: 25, color: Colors.black54),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          UiHelper.CustomTextField(emailcontroller, "Email", Icons.mail, false),

          UiHelper.CustomTextField(
            passwordcontroller,
            "Password",
            Icons.password,
            true,
          ),

          SizedBox(height: 20),

          UiHelper.CustomButton(() {
            login(
              emailcontroller.text.toString(),
              passwordcontroller.text.toString(),
            );
          }, "Login"),

          SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already Have an Account ?", style: TextStyle(fontSize: 25)),

              SizedBox(width: 10),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signup()),
                  );
                },
                child: Text("Signup", style: TextStyle(fontSize: 20)),
              ),

              SizedBox(height: 30),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPassword()),
                  );
                },
                child: Text("Forgot Password"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
