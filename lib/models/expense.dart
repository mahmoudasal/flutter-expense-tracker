import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// Setting up UUID generator for unique IDs
const uuid = Uuid();
// Date formatter to show dates in MM/DD/YYYY format (like 12/25/2023)
final formatter = DateFormat.yMd();

// The different types of expenses we can track
enum Category { food, travel, leisure, work }

// Icons that match each category - makes the UI more intuitive
const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.travel_explore,
  Category.leisure: Icons.local_activity,
  Category.work: Icons.work,
};

// Main expense class - this represents a single expense entry
class Expense {
  final String id; // Unique identifier (auto-generated)
  final String title; // What the expense was for (like "Lunch at Subway")
  final double amount; // How much it cost
  final DateTime date; // When it happened
  final Category category; // What type of expense it is

  // Constructor - when creating a new expense, we generate the ID automatically
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); // This creates a random unique ID

  // Getter that returns the date in a nice readable format
  String get formattedDate {
    return formatter.format(
      date,
    ); // Converts DateTime to something like "12/25/2023"
  }
}

// ExpenseBucket groups expenses by category - think of it like sorting into folders
class ExpenseBucket {
  final Category category; // Which category this bucket represents
  final List<Expense> expenses; // All the expenses in this category

  // Regular constructor - if you already have a list of expenses for a category
  const ExpenseBucket({required this.category, required this.expenses});

  // Alternative constructor - automatically filters expenses by category
  // This is the one we usually use - give it all expenses and it picks the right ones
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
    : expenses = allExpenses
          .where(
            (expense) => expense.category == category,
          ) // Filter by category
          .toList(); // Convert back to a list

  // Calculate total spending for this category
  double get totalExpenses {
    double sum = 0;
    // Loop through each expense and add up the amounts
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }

  // Add a new expense to this bucket (probably won't use this much)
  void addExpense(Expense expense) {
    expenses.add(expense);
  }
}
