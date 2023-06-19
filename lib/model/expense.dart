import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formater = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.food_bank_outlined,
  Category.travel: Icons.travel_explore_outlined,
  Category.work: Icons.work,
  Category.leisure: Icons.movie_creation_outlined,
};

class Expense {
  Expense(
      {required this.amount,
      required this.date,
      required this.title,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formateddate {
    return formater.format(date);
  }
}
