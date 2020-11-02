import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AllExpenses extends StatefulWidget {
  @override
  _AllExpensesState createState() => _AllExpensesState();
}

class _AllExpensesState extends State<AllExpenses> {
  // Global Instance of DatabaseReference
  DatabaseReference databaseReference;

  @override
  void didChangeDependencies() {
    // Read data from firebase database
    readFirebaseData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    DatabaseReference reference =
        FirebaseDatabase.instance.reference(); // .child("expenses");
    return Scaffold(
      appBar: AppBar(
        title: Text("All Expenses"),
      ),
      body: FutureBuilder(
          future:
              FirebaseDatabase.instance.reference().child("expenses").once(),
          builder: (BuildContext context, data) {
            if (data.hasData) {
              print("data.data.value ${data.data.value}");
              return displayAllExpenses(data.data.value);
            } else if (data.hasError)
              return Text("something wet wrong.");
            else
              return CircularProgressIndicator();
          }),
    );
  }

  Widget displayAllExpenses(listItem) {
    return ListView.builder(
      itemCount: listItem.length,
      itemBuilder: (context, index) {
        print("listItem ${listItem[index]}");

        var singleData = listItem[index];
        return singleData != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 7,
                  child: ListTile(
                    title: Text(listItem[index]['Title']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(listItem[index]['Description']),
                        Text(listItem[index]['Amount'])
                      ],
                    ),
                  ),
                ),
              )
            : SizedBox();
      },
    );
  }

  void readFirebaseData() async {
    // Get Firebase database instance
    FirebaseDatabase _database = FirebaseDatabase.instance;

    // Get Database reference
    DatabaseReference _reference = _database.reference();

    // Init DatabaseReference
    //databaseReference = _reference.child("expenses");

    // var child = _reference.child("expenses");

    // DataSnapshot _snapShot = await child.once();
    //
    // print("Data $_snapShot");
    // print("Data ${_snapShot.value}");
  }
}
