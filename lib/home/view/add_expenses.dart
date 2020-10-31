import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget/intro/colors.dart';
import 'package:toast/toast.dart';

class AddExpenses extends StatefulWidget {
  @override
  _AddExpensesState createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> {
  //Global Instance of TextEditingController
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  TextEditingController _amountController = new TextEditingController();

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Expenses"),
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                    labelText: "Expense Title",
                    labelStyle:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400)),
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400)),
            SizedBox(height: 20),
            TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    labelText: "Expense Description",
                    labelStyle:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400)),
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400)),
            SizedBox(height: 20),
            TextFormField(
                controller: _amountController,
                decoration: InputDecoration(
                    labelText: "Expense Amount",
                    labelStyle:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400)),
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400)),
            SizedBox(height: 40),
            ButtonTheme(
              height: 47.0,
              minWidth: 200,
              child: RaisedButton(
                color: primaryColor,
                onPressed: () {
                  saveExpense();
                },
                child: Text(
                  "ADD",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      )),
    );
  }

  void saveExpense() {
    // Increment
    count += 1;

    print("click");

    // Get input Data
    String title = _titleController.text.trim();
    String description = _descriptionController.text.trim();
    String amount = _amountController.text.trim();

    // Get Firebase database instance
    FirebaseDatabase _database = FirebaseDatabase.instance;

    // Get Database reference
    DatabaseReference _reference = _database.reference();

    var child = _reference.child("expenses");

    child
        .child(count.toString())
        .set({"Title": title, "Description": description, "Amount": amount});

    // Toast
    Toast.show("New Expenses added successfully.", context,
        duration: Toast.LENGTH_SHORT);

    Future.delayed(Duration(milliseconds: 4000), () {
      Navigator.pop(context);
    });
  }
}
