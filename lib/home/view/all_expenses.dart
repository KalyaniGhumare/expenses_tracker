import 'package:flutter/material.dart';

class AllExpenses extends StatefulWidget {
  @override
  _AllExpensesState createState() => _AllExpensesState();
}

class _AllExpensesState extends State<AllExpenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Expenses"),
      ),
      body: SafeArea(
        child: Center(
          child: Text("All Expense"),
        ),
      ),
    );
  }
}
