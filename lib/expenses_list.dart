import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.registeredExpenses});

  final List<Expense> registeredExpenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: registeredExpenses.length,
        itemBuilder: (ctx, index) => Text(registeredExpenses[index].title));
  }
}
