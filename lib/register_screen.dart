import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54, // Set the AppBar background color
        centerTitle: true, // Center the title text
        title: Text(
          'Royal Caps',
          style: TextStyle(
            fontFamily: 'JacquesFrancoisShadow', // Custom font family to match
            fontSize: 24,
            color: Colors.black, // App bar title text color
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Create an Account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black, // Text color based on the theme
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle registration action
              },
              child: Text('Register'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary, // Updated to backgroundColor
                foregroundColor: Colors.white, // Text color on button
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Already have an account? Login',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary, // Text color matching the app's theme
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
