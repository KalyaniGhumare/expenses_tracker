import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget/database/dao/app_dao.dart';
import 'package:flutter_widget/database/db/app_database.dart';
import 'package:flutter_widget/database/model/user.dart';
import 'package:flutter_widget/intro/colors.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  /*
  * Global instance of Controller
  * */
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                controller: fNameController,
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
                controller: lNameController,
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
                maxLength: 10,
                maxLines: 1,
              ),
              TextFormField(
                controller: emailController,
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
                controller: cityController,
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
                  onPressed: () {
                    saveUser();
                  },
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

  saveUser() async {
    // Read TextFormField Value and store into string variable
    String fName = fNameController.text;
    String lName = lNameController.text;
    String mobileNumber = mobileController.text;
    String password = passwordController.text;
    String email = emailController.text;
    String city = cityController.text;

    // Database name
    const String DATABASE_NAME = "database.db";

    // Init Database
    final database =
        await $FloorAppDatabase.databaseBuilder(DATABASE_NAME).build();

    // Init Dao Object to access query
    AppDao appDao = database.appDao;

    // Insert Data
    User user = User(null, fName, lName, city, email, mobileNumber, password);
    await appDao.insertUser(user);

    // Create SnackBar Object
    SnackBar snackBar = SnackBar(
        content: Text("User added successfully"),
        duration: Duration(milliseconds: 3000));

    // show SnackBar
    _scaffoldKey.currentState.showSnackBar(snackBar);

    // Back to onBoard Screen
    Future.delayed(Duration(milliseconds: 3000), () {
      Navigator.of(context).pop();
    });
  }
}
