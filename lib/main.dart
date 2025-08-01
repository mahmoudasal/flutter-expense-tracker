import 'package:expense_tracker/expenses.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// Light mode colors - using a nice purple as the base
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181), // Purple looks good
);

// Dark mode colors - going with teal since it contrasts well
var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 125), // Dark teal
  brightness: Brightness.dark, // Tell Flutter this is for dark mode
);

// ============================================================================
// MAIN APP
// ============================================================================

// This is where everything starts
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp, // Only allow portrait mode
  // ]).then((fn) {
  runApp(
    MaterialApp(
      // Getting rid of that debug banner - looks cleaner
      debugShowCheckedModeBanner: false,

      // Dark theme setup
      darkTheme: ThemeData.dark().copyWith(
        // Using our custom dark colors
        colorScheme: kDarkColorScheme,

        // Making cards look good in dark mode
        cardTheme: CardThemeData().copyWith(
          color:
              kDarkColorScheme.secondaryContainer, // Nice background for cards
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ), // Some breathing room
        ),

        // Button styling for dark mode
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer, // Button color
            foregroundColor: kDarkColorScheme.onPrimaryContainer, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ), // Rounded buttons look modern
            ),
          ),
        ),
      ),

      // Light mode setup
      theme: ThemeData().copyWith(
        // Our custom purple theme
        colorScheme: kColorScheme,

        // White background looks clean
        scaffoldBackgroundColor: Colors.white,

        // App bar gets a dark header with light text
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor:
              kColorScheme.onPrimaryContainer, // Dark purple header
          foregroundColor: kColorScheme.primaryContainer, // Light text on dark
        ),

        // Cards in light mode
        cardTheme: CardThemeData().copyWith(
          color: kColorScheme.secondaryContainer, // Light background
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ), // Same spacing as dark
        ),

        // Light mode buttons
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer, // Light purple
            foregroundColor: kColorScheme.onPrimaryContainer, // Dark text
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Keep it consistent
            ),
          ),
        ),

        // Text styles for the whole app
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontSize: 16, // Good readable size
            fontWeight: FontWeight.bold, // Make titles stand out
            color: kColorScheme.onSecondaryContainer, // Dark text for contrast
          ),
          bodyMedium: TextStyle(
            color: kColorScheme.onSecondaryContainer, // Regular text color
          ),
        ),
      ),

      // Let the system decide light or dark mode
      themeMode: ThemeMode.system,

      // Start with our expenses screen
      home: Expenses(),
    ),
  );
  // }); // This keeps the app in portrait mode
}
