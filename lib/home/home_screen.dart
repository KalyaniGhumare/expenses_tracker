import 'package:flutter/material.dart';
import 'package:flutter_widget/home/view/add_expenses.dart';
import 'package:flutter_widget/home/view/all_expenses.dart';
import 'package:flutter_widget/home/view/dashbaord.dart';
import 'package:flutter_widget/home/view/profile_screen.dart';
import 'package:flutter_widget/intro/colors.dart';
import 'package:flutter_widget/intro/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, DashBoard"),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hi, Welcome",
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                SizedBox(height: 30),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: primaryColor,
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.dashboard, size: 26, color: primaryColor),
                  title: Text("Dashboard",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  // trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  leading: Icon(Icons.person, size: 26, color: primaryColor),
                  title: Text("Profile",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  onTap: () {
                    // Close Drawer
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  },
                  // trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  leading:
                      Icon(Icons.list_sharp, size: 26, color: primaryColor),
                  title: Text("All Expenses",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  onTap: () {
                    // Close Drawer
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AllExpenses()));
                  },
                  // trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  leading:
                      Icon(Icons.add_circle, size: 26, color: primaryColor),
                  title: Text("Add Expenses",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  onTap: () {
                    // Close Drawer
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddExpenses()));
                  },
                  // trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                    leading:
                        Icon(Icons.exit_to_app, size: 26, color: primaryColor),
                    title: Text("Logout",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    onTap: () {
                      // Open New Dialog Box

                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                "Logout",
                                style: TextStyle(
                                    fontSize: 22.0,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              content: Text(
                                "Do you want to logout from this device?",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              actions: [
                                OutlineButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Cancel",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: primaryColor)),
                                    )),
                                FlatButton(
                                  onPressed: () async {
                                    SharedPreferences pref =
                                        await SharedPreferences.getInstance();

                                    // Remove Pref Values
                                    pref.clear();

                                    Future.delayed(Duration(milliseconds: 3000),
                                        () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SplashScreen()),
                                          (route) => false);
                                    });
                                  },
                                  child: Text("Logout",
                                      style: TextStyle(
                                          fontSize: 16.0, color: primaryColor)),
                                )
                              ],
                            );
                          });
                    }
                    // trailing: Icon(Icons.arrow_forward_ios),
                    )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        //color: Colors.green,
        child: DashBoardScreen(),
      ),
    );
  }
}
