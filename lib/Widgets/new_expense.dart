import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onaddexpense});

  final void Function(Expense expense) onaddexpense;

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  DateTime? selecteddate;
  Category _selectedCAtegory = Category.leisure;

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

  void submitExpenseData() {
    final enteredamount = double.tryParse(_amountcontroller.text);
    final amountInvalid = enteredamount == null || enteredamount <= 0;
    if (_titlecontroller.text.trim().isEmpty ||
        amountInvalid ||
        selecteddate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid input!!'),
                content: const Text(
                    'please make sure that right inputs are entered!!'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text('Okay')),
                ],
              ));
      return;
    }
    widget.onaddexpense(Expense(
        amount: enteredamount,
        date: selecteddate!,
        title: _titlecontroller.text,
        category: _selectedCAtegory));

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titlecontroller.dispose();
    _amountcontroller;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keypad = MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 48, 16, keypad + 16),
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
                  width: 20,
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
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  DropdownButton(
                      value: _selectedCAtegory,
                      items: Category.values
                          .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Text(
                                category.name.toUpperCase(),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedCAtegory = value;
                        });
                      }),
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancle")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: submitExpenseData, child: const Text("Save"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
