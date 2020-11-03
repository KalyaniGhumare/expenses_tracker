import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          onPressed: () {
            openBottomSheet();
          },
          child: Text("Show BottomSheet"),
        ),
      ),
    );
  }

  openBottomSheet() {
    showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.grey,
            height: 400.0,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                Text("Text1"),
                Text("Text1"),
                Text("Text1"),
                Text("Text1"),
                Text("Text1"),
                Text("Text1"),
                Text("Text1"),
              ],
            ),
          );
        });
  }
}
