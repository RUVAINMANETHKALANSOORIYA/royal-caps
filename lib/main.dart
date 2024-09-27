import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart'; // Import RegisterPage
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false; // Track dark mode status

  void _toggleThemeMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Royal Caps',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(), // Toggle theme
      home: LoginPage(toggleTheme: _toggleThemeMode), // Pass toggle function to the login page

    );
  }
}
