import 'package:flutter/material.dart';
import 'package:npr/View/widget/appbar.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Forgot Password', showBackArrow: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 8,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Username Text Field
                _buildTextField(_usernameController, 'Enter Username'),
                SizedBox(height: 16.0), // Space between fields

                // Password Text Field
                _buildTextField(_passwordController, 'Enter Password',
                    isPassword: true),
                SizedBox(height: 16.0), // Space between fields

                // Confirm Password Text Field
                _buildTextField(_confirmPasswordController, 'Re-enter Password',
                    isPassword: true),
                SizedBox(height: 32.0), // Space before the button

                // Confirm Button
                ElevatedButton(
                  onPressed: () {
                    // Logic to handle password reset
                    String username = _usernameController.text;
                    String password = _passwordController.text;
                    String confirmPassword = _confirmPasswordController.text;

                    if (password == confirmPassword) {
                      _showSuccessDialog(context); // Show success dialog
                    } else {
                      // Show an error message
                      print('Passwords do not match');
                      _showErrorDialog(context); // Show error dialog
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white, // Text color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Confirm', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword, // Hide password input if specified
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
          borderSide: BorderSide(color: Colors.teal),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.teal, width: 2),
        ),
        labelStyle: TextStyle(color: Colors.teal),
        hintStyle: TextStyle(color: Colors.teal.withOpacity(0.5)), // Hint color
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Rounded corners
          ),
          title: Row(
            children: [
              Icon(Icons.check_circle,
                  color: Colors.green, size: 30), // Success icon
              SizedBox(width: 10), // Space between icon and text
              Text(
                'Success',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Text(
            'Your password has been changed successfully!',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'OK',
                style: TextStyle(color: Colors.teal), // Button color
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.teal), // Button color
              ),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Passwords do not match!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
