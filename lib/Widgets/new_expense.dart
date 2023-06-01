import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  DateTime? selecteddate;
  void datepicker() async {
    final now = DateTime.now();
    final firstdate = DateTime(now.year - 1, now.month, now.day);

    final pickeddate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstdate,
        lastDate: now);
    setState(() {
      selecteddate = pickeddate;
    });
  }

  @override
  void dispose() {
    _titlecontroller.dispose();
    _amountcontroller;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Title")),
            controller: _titlecontroller,
          ),
          Row(children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text("Amount"), prefix: Text("₹")),
                controller: _amountcontroller,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Row(
              children: [
                Text(selecteddate == null
                    ? 'No Date Selected'
                    : formater.format(selecteddate!)),
                IconButton(
                    onPressed: datepicker,
                    icon: const Icon(Icons.calendar_month_rounded))
              ],
            ))
          ]),
          const SizedBox(height: 10),
          Row(
            children: [
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancle")),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Save"))
            ],
          )
        ],
      ),
    );
  }
}
