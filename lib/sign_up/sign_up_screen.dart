import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget/intro/colors.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Set App Bar Color
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: primaryColor),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            // Set Alignment horizontal or Vertical
            scrollDirection: Axis.vertical,
            children: [
              Container(
                // padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Create a new Account",
                  style: TextStyle(
                      fontSize: 26.0,
                      color: primaryColor,
                      fontWeight: FontWeight.w400),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "First Name",
                    labelStyle: TextStyle(fontSize: 16.0, color: Colors.grey)),
                style: TextStyle(fontSize: 18.0, color: Colors.black),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                //maxLength: 10,
                maxLines: 1,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Last Name",
                    labelStyle: TextStyle(fontSize: 16.0, color: Colors.grey)),
                style: TextStyle(fontSize: 18.0, color: Colors.black),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                // maxLength: 10,
                maxLines: 1,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Mobile Number",
                    labelStyle: TextStyle(fontSize: 16.0, color: Colors.grey)),
                style: TextStyle(fontSize: 18.0, color: Colors.black),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                maxLength: 10,
                maxLines: 1,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(fontSize: 16.0, color: Colors.grey)),
                style: TextStyle(fontSize: 18.0, color: Colors.black),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                // maxLength: 10,
                maxLines: 1,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "City",
                    labelStyle: TextStyle(fontSize: 16.0, color: Colors.grey)),
                style: TextStyle(fontSize: 18.0, color: Colors.black),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                // maxLength: 10,
                maxLines: 1,
              ),
              SizedBox(height: 30.0),
              ButtonTheme(
                height: 47,
                child: RaisedButton(
                  color: primaryColor,
                  onPressed: () {},
                  child: Text(
                    "SAVE",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
