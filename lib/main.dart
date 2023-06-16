import 'package:flutter/material.dart';

import 'package:expense_tracker/Widgets/expenses.dart';

var kcolorscheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 77, 14, 252));
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kcolorscheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kcolorscheme.onPrimaryContainer,
          foregroundColor: kcolorscheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
            color: kcolorscheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kcolorscheme.primaryContainer)),
      ),
      home: const Expenses(),
    ),
  );
}
