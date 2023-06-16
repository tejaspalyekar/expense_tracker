import 'package:expense_tracker/Widgets/expenses_list/expense_item.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key,
      required this.registeredExpenses,
      required this.removeexpense});

  final List<Expense> registeredExpenses;
  final void Function(Expense expense) removeexpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: registeredExpenses.length,
        itemBuilder: (ctx, index) => Dismissible(
            key: ValueKey(registeredExpenses[index]),
            onDismissed: (direction) {
              removeexpense(registeredExpenses[index]);
            },
            child: ExpenseItem(registeredExpenses[index])));
  }
}
