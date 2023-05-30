import 'package:expense_tracker/Widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        amount: 200.0,
        date: DateTime.now(),
        title: 'Movie',
        category: Category.leisure),
    Expense(
        amount: 150.0,
        date: DateTime.now(),
        title: 'fried nation',
        category: Category.food)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Chat"),
          Expanded(
              child: ExpensesList(registeredExpenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
