import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import the HomePage widget
import 'register_screen.dart'; // Import the RegisterPage widget

class LoginPage extends StatefulWidget {
  final VoidCallback toggleTheme;

  LoginPage({required this.toggleTheme});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Pass the toggleTheme callback to HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(toggleTheme: widget.toggleTheme)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check if dark mode is enabled
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Royal Caps',
          style: TextStyle(
            fontFamily: 'JacquesFrancoisShadow', // Set the custom font family
            fontSize: 24, // Adjust the font size as needed
          ),
        ),
        backgroundColor: Colors.black54,
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: widget.toggleTheme, // Dark mode toggle action
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'JacquesFrancoisShadow', // Apply the custom font
                    color: Colors.blueGrey[900],
                  ),
                ),
                SizedBox(height: 30),
                // Username TextFormField
                TextFormField(
                  controller: _usernameController,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black, // Set text color
                  ),
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.black54, // Label color
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: isDarkMode ? Colors.white70 : Colors.black54, // Icon color
                    ),
                    filled: true,
                    fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[200], // Background color
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                // Password TextFormField
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black, // Set text color
                  ),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.black54, // Label color
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: isDarkMode ? Colors.white70 : Colors.black54, // Icon color
                    ),
                    filled: true,
                    fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[200], // Background color
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text(
                    'Create an account',
                    style: TextStyle(fontSize: 16, color: Colors.blueGrey[700]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
