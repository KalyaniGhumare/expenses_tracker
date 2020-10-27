import 'package:flutter/material.dart';
import 'package:flutter_widget/intro/colors.dart';
import 'package:flutter_widget/sign_in/LogInScreen.dart';
import 'package:flutter_widget/sign_up/sign_up_screen.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  OnBoardScreenState createState() => OnBoardScreenState();
}

class OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // #D2302C
                Text("Expenses Tracker",
                    style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
                SizedBox(height: 30.0),
                Image.asset(
                  "assets/expenses.jpeg",
                  width: 140,
                  height: 140,
                ),
                SizedBox(height: 50.0),
                ButtonTheme(
                  // minWidth: 120,
                  height: 47.0,
                  child: RaisedButton(
                    color: primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35.0, vertical: 3.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: Text("Let's Start",
                        style: TextStyle(fontSize: 18.0, color: Colors.white)),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /*
                    */
                    Container(
                      height: 1,
                      width: 50,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10.0),
                    Text("OR",
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                    SizedBox(width: 10.0),
                    Container(
                      height: 1,
                      width: 50,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text("Already Login?",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: primaryColor,
                          fontWeight: FontWeight.w400)),
                ),
                // Divider(
                //   height: 1,
                //   thickness: 1,
                //   color: Colors.black,
                // ),
              ],
            )),
      ),
    );
  }
}
