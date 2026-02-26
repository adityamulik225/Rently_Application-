import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiHelper {
  static CustomTextField(TextEditingController controller,
      String text,
      IconData iconData,
      bool toHide,) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      child: TextField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
          hintText: text,
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }

  static CustomButton(VoidCallback voidcallback, String text) {
    return SizedBox(
      height: 50,
      width: 150,
      child: ElevatedButton(
        onPressed: voidcallback,

        child: Text(text, style: TextStyle(color: Colors.blueAccent, fontSize: 20)),

      ),
    );
  }


  static CustomAlertBox(BuildContext context, String text) {
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text(text),
      );
    });
  }
}
