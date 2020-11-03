import 'package:flutter/material.dart';
import 'package:flutter_widget/database/dao/app_dao.dart';
import 'package:flutter_widget/database/db/app_database.dart';
import 'package:flutter_widget/database/model/user.dart';
import 'package:flutter_widget/intro/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Update SQLite Data

  /*
  * Global instance of Controller
  * */
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  // Init Dao Object to access query
  AppDao appDao;

  User user;

  String mobile;

  @override
  void initState() {
    // Read User Details From local database
    readUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text("Edit Profile"),
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
                  "Update Profile",
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
                    updateUser();
                  },
                  child: Text(
                    "UPDATE",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              )
            ],
          )),
    );
  }

  void readUserDetails() async {
    // Get User id from sharedpref.

    var pref = await SharedPreferences.getInstance();

    mobile = pref.getString("SP_KEY_MOBILE");
    print("user id $mobile");

    // Database name
    const String DATABASE_NAME = "database.db";

    // Init Database
    final database =
        await $FloorAppDatabase.databaseBuilder(DATABASE_NAME).build();

    appDao = database.appDao;

    user = await appDao.readUserDetails(mobile);

    // Set User value to editText
    fNameController.text = user.fName;
    lNameController.text = user.lName;
    mobileController.text = user.mobile;
    passwordController.text = user.password;
    emailController.text = user.email;
    cityController.text = user.city;

    print("user name ${user.fName}");
  }

  updateUser() async {
    // Get user value form editext
    String fName = fNameController.text;
    String lName = lNameController.text;
    String mobile = mobileController.text;
    String city = cityController.text;
    String email = emailController.text;
    String password = passwordController.text;

    User updateUser =
        new User(user.id, fName, lName, city, email, mobile, password);

    // Update
    int value = await appDao.updateUser(updateUser);

    print("value $value");
  }

  deleteUser() async
  {
    // Read User
    user = await appDao.readUserDetailsForDeleteRecord(mobile);

    if(user != null)
      {
        await appDao.deleteUser(user);
      }
  }
}
