import 'package:flutter/material.dart';
import 'package:flutter_widget/home/home_screen.dart';
import 'package:flutter_widget/intro/onboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  // This method similar to onStart Activity Of Android
  void didChangeDependencies() {
    checkUserSession();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Expense Tracker",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown)),
            SizedBox(height: 20),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }

  void checkUserSession() async {
    // Create SharedPreferences Object
    SharedPreferences pref = await SharedPreferences.getInstance();

    bool isLogin = pref.getBool("SP_KEY_IS_LOGGING") ?? false;

    if (isLogin) {
      Future.delayed(Duration(milliseconds: 3000), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
      });
    } else {
      Future.delayed(Duration(milliseconds: 3000), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => OnBoardScreen()),
            (route) => false);
      });
    }
  }
}
