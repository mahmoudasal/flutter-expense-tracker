import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.food;
  DateTime? _selectedDate;

  void _presentDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now(),
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _showDialog() {
    if (Platform.isIOS || Platform.isMacOS) {
      showCupertinoDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Invalid Input"),
          content: Text("Please ensure all fields are valid."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Okay"),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Invalid Input"),
          content: Text("Please ensure all fields are valid."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Okay"),
            ),
          ],
        ),
      );
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Invalid Input"),
        content: Text("Please ensure all fields are valid."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Okay"),
          ),
        ],
      ),
    );
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      _showDialog();

      return;
    }
    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return SingleChildScrollView(
      // Allow scrolling when content overflows
      child: Padding(
        // Add bottom padding = keyboard height + 16 for spacing
        padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
        child: Column(
          children: [
            if (width >= 600)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _titleController,
                      maxLength: 50,
                      decoration: InputDecoration(label: Text("Title")),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefix: Text("\$ "),
                        label: Text("Amount"),
                      ),
                    ),
                  ),
                ],
              )
            else
              TextField(
                controller: _titleController,
                maxLength: 50,
                decoration: InputDecoration(label: Text("Title")),
              ),

            if (width >= 600)
              Row(
                children: [
                  DropdownButton(
                    value: _selectedCategory,
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase()),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _selectedDate == null
                              ? "No Date Selected"
                              : formatter.format(_selectedDate!),
                        ),
                        IconButton(
                          onPressed: _presentDatePicker,
                          icon: Icon(Icons.calendar_month),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            else
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefix: Text("\$ "),
                        label: Text("Amount"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _selectedDate == null
                              ? "No Date Selected"
                              : formatter.format(_selectedDate!),
                        ),
                        IconButton(
                          onPressed: _presentDatePicker,
                          icon: Icon(Icons.calendar_month),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 16),

            if (width >= 600)
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: _submitExpenseData,
                    child: Text("Save Expense"),
                  ),
                ],
              )
            else
              Row(
                children: [
                  DropdownButton(
                    value: _selectedCategory,
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase()),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: _submitExpenseData,
                    child: Text("Save Expense"),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
