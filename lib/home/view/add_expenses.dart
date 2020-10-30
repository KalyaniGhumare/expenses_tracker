import 'package:flutter/material.dart';

class AddExpenses extends StatefulWidget {
  @override
  _AddExpensesState createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Expenses"),
      ),
      body: SafeArea(
        child: Center(
          child: Text("Add Expense"),
        ),
      ),
    );
  }
}
