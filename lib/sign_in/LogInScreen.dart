import 'package:flutter/material.dart';
import 'package:flutter_widget/database/dao/app_dao.dart';
import 'package:flutter_widget/database/db/app_database.dart';
import 'package:flutter_widget/database/model/user.dart';
import 'package:flutter_widget/intro/colors.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  // Global Instance of Controller
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30.0),
              Text(
                "Login",
                style: TextStyle(fontSize: 28.0, color: Colors.black),
              ),
              SizedBox(height: 30.0),
              TextFormField(
                controller: mobileController,
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
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(fontSize: 16.0, color: Colors.grey)),
                style: TextStyle(fontSize: 18.0, color: Colors.black),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
              SizedBox(height: 50.0),
              ButtonTheme(
                height: 47,
                child: RaisedButton(
                  color: primaryColor,
                  onPressed: () {
                    loginUser();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              )
            ],
          )),
    );
  }

  void loginUser() async {
    // Get user data
    String mobileNumber = mobileController.text;
    String password = passwordController.text;

    // Database name
    const String DATABASE_NAME = "database.db";

    // Init Database
    final database =
        await $FloorAppDatabase.databaseBuilder(DATABASE_NAME).build();

    // Init Dao Object to access query
    AppDao appDao = database.appDao;

    // Check user exists in database or not
    User user = await appDao.checkUser(mobileNumber, password);

    if (user != null) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
            content: Text("User login successfully"),
            duration: Duration(milliseconds: 3000)),
      );
    } else {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
            content: Text("Username And Password not match"),
            duration: Duration(milliseconds: 5000)),
      );
    }
  }
}
