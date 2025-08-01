import 'package:expense_tracker/widgets/charts/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  // Opens the add expense modal that adapts to keyboard
  _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows sheet to take full screen height
      useSafeArea: true, // Respects safe area boundaries (notches, etc.)
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  final List<Expense> _registeredExpenses = [
    Expense(
      title: "New Shoes",
      amount: 69.99,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Groceries",
      amount: 16.53,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Expense removed"),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () => setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text("No expenses found. Start adding some!"),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flutter Expenses Tracker", style: TextStyle(fontSize: 21)),
        actions: [
          IconButton(
            onPressed: () {
              _openAddExpenseOverlay();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                const SizedBox(width: 16),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
